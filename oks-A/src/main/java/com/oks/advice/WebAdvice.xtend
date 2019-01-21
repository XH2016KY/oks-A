package com.oks.advice

import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.ResponseBody

@ControllerAdvice
class WebAdvice {
	
	@ExceptionHandler(RuntimeException)
	@ResponseBody
	def handleBindException(RuntimeException e) {
		println("RuntimeException")
        var message = e.getMessage();
	    message	    
	}
	
	
	
}