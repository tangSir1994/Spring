package com.mr.service;

import com.mr.pojo.Bank;
import com.mr.util.Page;

import java.util.List;

/**
 * Created by Mr.Bai on 2019/4/11.
 */
public interface BankService {



    List<Bank> listbank(Page page);
}
