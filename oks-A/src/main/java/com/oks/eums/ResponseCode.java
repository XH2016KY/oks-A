package com.oks.eums;

import lombok.Getter;

@Getter
public enum ResponseCode {
	
	OK(200,"响应成功"),
	
	ERROR(500,"服务器响应错误");
	
	
	private Integer code;
	
	private String msg;
	
	private ResponseCode(Integer code,String msg) {
		this.code = code;
		this.msg = msg;
	}

}
