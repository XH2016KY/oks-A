package com.oks.utils

import org.eclipse.xtend.lib.annotations.Accessors
import org.apache.commons.lang3.builder.ReflectionToStringBuilder
import org.apache.commons.lang3.builder.ToStringStyle

@Accessors class Person {
	
	new(){}
	
	new(String name,Integer age){
		this.name = name
		this.age = age
	}
	
	String name
	
	Integer age
	
	override toString() {
		ReflectionToStringBuilder.toString(this, ToStringStyle.JSON_STYLE);
	}
	
	def static void main(String[] args) {
		var p1 = new Person("HHs",13)
		var p2 = new Person("NN",9)
		var p3 = new Person("NN",13)
		
		var list = #[p1,p2,p3]
		
		val toList = list.filter[one|one.age>10].groupBy[one|one.name.contains("s")]
		
		println(toList)
	}
	
	
}