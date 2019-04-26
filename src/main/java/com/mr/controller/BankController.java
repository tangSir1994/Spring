package com.mr.controller;


import com.github.pagehelper.PageInfo;
import com.mr.pojo.Bank;
import com.mr.service.BankService;
import com.mr.util.DataGridVo;
import com.mr.util.LayResult;
import com.mr.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Mr.Bai on 2019/4/11.
 */
@Controller
public class BankController {

    @Autowired
   private BankService bankService;


    /**
     * 查询全部信息
     * @return
     */
    @RequestMapping("listbank")
    @ResponseBody
    public DataGridVo<Bank> listbank(Page page){
        List<Bank> cars=bankService.listbank(page);
        PageInfo<Bank> pageCar = new PageInfo<Bank>(cars);
        DataGridVo<Bank> car = new DataGridVo<Bank>(0,"",pageCar.getTotal(),pageCar.getList());
        return car;
    }



}
