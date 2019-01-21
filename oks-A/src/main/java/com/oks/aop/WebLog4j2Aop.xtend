package com.oks.aop

import org.aspectj.lang.annotation.Aspect
import org.apache.logging.log4j.Logger
import org.apache.logging.log4j.LogManager
import org.aspectj.lang.annotation.Pointcut
import java.util.Date
import org.aspectj.lang.annotation.Around
import org.aspectj.lang.ProceedingJoinPoint
import org.springframework.core.annotation.Order

@Aspect
@Order(-2)
class WebLog4j2Aop {

	val static Logger log = LogManager.getLogger(WebLog4j2Aop)

	/**
	 *  切入点注解
	 */
	@Pointcut(value="@within(com.oks.annotation.WebLog4j2)")
	def webPoint() {}

	@Around(value="webPoint()")
	def around(ProceedingJoinPoint proceedingJoinPoint) {
		var start = new Date().time
		var name = proceedingJoinPoint.signature.declaringType.name
		var method = proceedingJoinPoint.signature.name
		log.info("{}的{}方法-主线程开始处理开始->{}", name,method,start)
		try {
			proceedingJoinPoint.proceed(proceedingJoinPoint.args)
		}finally {
			log.info("{}的{}方法-主线程结束->{}", name,method,new Date().time - start)
		}
	}
}
