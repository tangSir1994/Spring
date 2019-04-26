package com.mr.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mr.mapper.BankMapper;
import com.mr.pojo.Bank;
import com.mr.service.BankService;
import com.mr.util.LayResult;
import com.mr.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Mr.Bai on 2019/4/11.
 */
@Service
public class BankServiceImpl  implements BankService {
   @Autowired
    private BankMapper bankMapper;






    public List<Bank> listbank(Page page) {
        return bankMapper.listbank();
    }
}
