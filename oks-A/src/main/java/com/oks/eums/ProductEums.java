package com.oks.eums;

import lombok.Getter;

@Getter
public enum ProductEums {
	
	NOT_ENOUGH(403,"库存不够"),
	SUCCESS(200,"购买成功");
	
	
	private Integer code;
	
	private String msg;
	
    ProductEums(Integer code,String msg) {
		this.code = code;
		this.msg = msg;
	}

}
