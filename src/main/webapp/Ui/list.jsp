<%--
  Created by IntelliJ IDEA.
  User: YuanBo
  Date: 2019/4/8
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css">
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
</head>
<body>
<!--条件查询-->
<%--
<div class="demoTable">
    车辆名称：
    <div class="layui-inline">
        <input name="carName" class="layui-input" id="carName" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload" id="search">检索车辆名称</button>

    车辆起始价格：
    <div class="layui-inline">
        <input name="carStartPrice" class="layui-input" id="carStartPrice" autocomplete="off">
    </div>

    车辆结束价格：
    <div class="layui-inline">
        <input name="carEndPrice" class="layui-input" id="carEndPrice" autocomplete="off">
    </div>

    <button class="layui-btn" data-type="reload" id="search1">检索车辆价格</button>
</div>
--%>

<table id="demo" lay-filter="test"></table>


<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="add">新增</button>
        <button class="layui-btn layui-btn-sm" lay-event="update">编辑</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <button class="layui-btn layui-btn-sm" lay-event="delete">删除</button>
</script>
<script>
    layui.use('table', function(){
        var table = layui.table;
            <!-----------------查询-------------------->
        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 480
            ,url: '<%=request.getContextPath()%>/listbank.do' //数据接口
            ,page: true, //开启分页
            toolbar: '#toolbarDemo'//开启工具栏
            ,even:true
            ,style:'background-color: #5FB878; color: #fff;'
            ,cols: [[ //表头
                ,{type: 'checkbox', fixed: 'left'}
                ,{field: 'bankId', title: 'ID', width:200,  totalRowText: '合计：'}
                ,{field: 'bankNo', title: '卡号', width:200}
                ,{field: 'bankType', title: '卡种', width: 200,
                    templet: function(d){
                      if(d.bankType=='1'){
                          return '储蓄卡'
                      }else {
                          return '信用卡'
                      }
                    },


                  }
                ,{field: 'bankBelong',title: '归属银行', width: 200,

                    templet: function(d){
                    if(d.bankBelong==1){
                       return '中国银行'
                    }else if(d.bankBelong==2){
                         return '建设银行'
                    }else if(d.bankBelong==3){
                        return '民生银行'
                    }else if(d.bankBelong==4){
                        return '招商银行'
                    }

                    }


                }
                ,{field: 'bankName', title: '开户人', width:200}
                ,{field: 'bankMoney', title: '账户余额', width:200}
                ,{field: 'bankDate', title: '开户时间', width:200,

                    templet :function (row){
                        return createTime(row.bankDate);
                    }

                }
            ]]
        });

        <!--条件查询-->
        var $ = layui.$,active={
            reload:function(){
                table.reload('demo',{
                    where:{carName:$("#carName").val(),carStartPrice:$("#carStartPrice").val(),carEndPrice:$("#carEndPrice").val()}
                })
            }
        }

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        <!-----------------------------------------------新增-------------------------->
        //监听事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id),data = checkStatus.data;
            switch(obj.event){
                case 'add':
                    layer.open({
                        type: 2,
                        //skin: 'layui-layer-rim', //加上边框
                        area: ['420px', '240px'], //宽高
                        content:'<%=request.getContextPath()%>/Ui/add.jsp',
                        btn:['确定','取消'],
                        yes:function(index,layero){
                            var formSubmit = layer.getChildFrame('form',index);
                            var submited = formSubmit.find('button')[0];
                            submited.click();
                            location.reload();
                        }
                    });
                    break;
                case 'delete':
                    if(data.length<0){
                        layer.msg('请选择一行删除');
                    }
                    break;
                    <!-------------------打开修改回显页面-------------->
                case 'update':
                    layer.open({
                        type: 2,
                        //skin: 'layui-layer-rim', //加上边框
                        area: ['420px', '240px'], //宽高
                        content:'<%=request.getContextPath()%>/LayUi/selectByCarId.do?id='+data[0].carId,
                        btn:['确定','取消'],
                        yes:function(index,layero){
                            var formSubmit = layer.getChildFrame('form',index);
                            var submited = formSubmit.find('button')[0];
                            submited.click();
                            location.reload();
                        }
                    });
                    break;
            };
        });
        <!--------------删除-------------------------->
        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if(layEvent === 'delete'){ //删除
                layer.confirm('真的删除行么', function(index){
                    //obj.del();
                    console.log(obj);
                    console.log(data);
                    //layer.close(index);
                    $.ajax({
                        url: "<%=request.getContextPath()%>/LayUi/deleteCar.do",
                        type: "POST",
                        data:{'id':data.carId},
                        dataType: "text",
                        success: function(data){
                            if(data==null){
                                layer.msg("删除失败", {icon: 5});
                            }else{
                                //删除这一行
                                obj.del();
                                //关闭弹框
                                layer.close(index);
                                layer.msg("删除成功", {icon: 6});
                                layer.closeAll();
                                window.location.reload();
                                Load(); //删除完需要加载数据
                            }
                        },
                        error:function(){
                            alert(data);
                        },

                    });
                });
            }
        });




    });


</script>

<script type="text/javascript">
    function createTime(v){
        var date = new Date(v);
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        m = m<10?'0'+m:m;
        var d = date.getDate();
        d = d<10?("0"+d):d;
        var h = date.getHours();
        h = h<10?("0"+h):h;
        var M = date.getMinutes();
        M = M<10?("0"+M):M;
        var str = y+"-"+m+"-"+d+" "+h+":"+M;
        return str;
    }
</script>


</body>

</html>






