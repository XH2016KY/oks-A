package com.oks.web

import com.fasterxml.jackson.annotation.JsonInclude
import java.io.Serializable
import org.apache.commons.lang3.builder.ReflectionToStringBuilder
import org.apache.commons.lang3.builder.ToStringStyle
import org.eclipse.xtend.lib.annotations.Accessors

@JsonInclude(JsonInclude.Include.NON_NULL)
@Accessors class ServerRespose<T> implements Serializable{
	
	Integer code
	
	String msg
	
	T data
	
	private new (Integer code){
		this.code = code
	}
	
	private new(Integer code,String msg,T data){
		this.code = code 
		this.msg = msg
		this.data = data
	}
	
	private new(Integer code,T data){
		this.code = code
		this.data = data
	}
	
	def static SuccessOfOK(Integer code) {
		new ServerRespose(code)
	}
	
	def static<T> SuccessOfOK(Integer code,String msg,T data){
		new ServerRespose(code,msg,data)
	}
	
	def static SuccessOfOK(Integer code,Object data){
		new ServerRespose(code,data)
	}
	
	def static FailOfError(Integer code) {
		new ServerRespose(code,"用户不存在",null)
	}
	
	def static FailOfError(Integer code,String msg) {
		new ServerRespose(code,msg,null)
	}
	
	override toString() {
		ReflectionToStringBuilder.toString(this, ToStringStyle.JSON_STYLE);
	}
	  
}