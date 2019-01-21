package com.oks.pojo

import org.apache.commons.lang3.builder.ReflectionToStringBuilder
import org.apache.commons.lang3.builder.ToStringStyle
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors class Product {
	
	new(String name,Integer quatity){
		this.name = name
		this.quatity = quatity
	}
	
	String name
	
	Integer quatity
	
	override toString() {
		ReflectionToStringBuilder.toString(this, ToStringStyle.JSON_STYLE);
	}
	
}