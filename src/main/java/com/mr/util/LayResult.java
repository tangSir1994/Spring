package com.mr.util;

import java.util.List;

/**
 * Created by Administer on 2019/4/8.
 */
public class LayResult<E> {
    private Integer code;
    private String msg;
    private Long count;
    private List<E> data;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public List<E> getData() {
        return data;
    }

    public void setData(List<E> data) {
        this.data = data;
    }
}
