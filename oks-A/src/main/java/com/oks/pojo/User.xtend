package com.oks.pojo

import org.eclipse.xtend.lib.annotations.Accessors
import org.apache.commons.lang3.builder.ReflectionToStringBuilder
import org.apache.commons.lang3.builder.ToStringStyle

@Accessors class User {

	
	String name
	
	String password
	
	override toString() {
		ReflectionToStringBuilder.toString(this, ToStringStyle.JSON_STYLE);
	}
	
	
	def static void main(String[] args) {
		var u = new User
		u.name = ""
	}
}