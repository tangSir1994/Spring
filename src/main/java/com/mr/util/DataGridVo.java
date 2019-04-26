package com.mr.util;

import java.util.List;

public class DataGridVo<T> {

	private Integer code =0;

	private String msg;

	private Long count;
	
	private List<T> data;

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

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public DataGridVo(Integer code, String msg, Long count, List<T> data) {
		this.code = code;
		this.msg = msg;
		this.count = count;
		this.data = data;
	}

	public DataGridVo() {
		super();
	}
}
