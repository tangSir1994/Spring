package com.mr.pojo;

import java.io.Serializable;
import java.util.Date;

public class Bank implements Serializable {
    private Integer bankId;

    private String bankNo;

    private Integer bankType;

    private Integer bankBelong;

    private String bankName;

    private Double bankMoney;

    private Date bankDate;

    public Integer getBankId() {
        return bankId;
    }

    public void setBankId(Integer bankId) {
        this.bankId = bankId;
    }

    public String getBankNo() {
        return bankNo;
    }

    public void setBankNo(String bankNo) {
        this.bankNo = bankNo == null ? null : bankNo.trim();
    }

    public Integer getBankType() {
        return bankType;
    }

    public void setBankType(Integer bankType) {
        this.bankType = bankType;
    }

    public Integer getBankBelong() {
        return bankBelong;
    }

    public void setBankBelong(Integer bankBelong) {
        this.bankBelong = bankBelong;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName == null ? null : bankName.trim();
    }

    public Double getBankMoney() {
        return bankMoney;
    }

    public void setBankMoney(Double bankMoney) {
        this.bankMoney = bankMoney;
    }

    public Date getBankDate() {
        return bankDate;
    }

    public void setBankDate(Date bankDate) {
        this.bankDate = bankDate;
    }
}