package com.mr.mapper;

import com.mr.pojo.Bank;

import java.util.List;

public interface BankMapper {
    int deleteByPrimaryKey(Integer bankId);

    int insert(Bank record);

    int insertSelective(Bank record);

    Bank selectByPrimaryKey(Integer bankId);

    int updateByPrimaryKeySelective(Bank record);

    int updateByPrimaryKey(Bank record);

    List<Bank> listbank();
}