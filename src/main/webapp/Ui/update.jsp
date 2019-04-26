<%--
  Created by IntelliJ IDEA.
  User: YuanBo
  Date: 2019/4/8
  Time: 20:11
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

<form class="layui-form" action="/LayUi/updateCar.do">

    <div class="layui-form-item layui-form-pane">
        <label class="layui-form-label">车辆主键:</label>
        <div class="layui-input-block">
            <input type="text" name="carId"  value="${car.carId}" required  lay-verify="required" placeholder="请输入车辆名称" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item layui-form-pane">
        <label class="layui-form-label">车辆名称:</label>
        <div class="layui-input-block">
            <input type="text" name="carName"  value="${car.carName}" required  lay-verify="required" placeholder="请输入车辆名称" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item layui-form-pane">
        <label class="layui-form-label">车辆价格:</label>
        <div class="layui-input-block">
            <input type="text" name="carPrice"  value="${car.carPrice}" required  lay-verify="number" placeholder="请输入车辆价格" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <!-- 隐藏提交按钮，在父层中调用 -->
            <button id="addDepartment" class="layui-btn" lay-filter="formVerify" lay-submit style="display: none">提交</button>
        </div>
    </div>
</form>
<script>
    layui.use(['form'],function () {
        var form = layui.form;
        form.verify({
            carName: function (value, item) {
                //value：表单的值、item：表单的DOM对象
                if (value.length < 0) {
                    return '姓名不能为空';
                }
            },
            carPrice: function (value, item) {
                if (value.length < 0) {
                    return '年龄不能为空';
                }
            }

        });

        form.on('submit(formVerify)',function (data) {
            // 提交成功后返回信息，关闭弹出层
            parent.layer.msg('操作成功', {
                icon: 1,
                time: 2000
            });

            //当你在iframe页面关闭自身时
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index);
            window.location.reload();
        });
    });

</script>
</body>
</html>

