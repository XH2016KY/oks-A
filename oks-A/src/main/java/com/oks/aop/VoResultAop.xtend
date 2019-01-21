package com.oks.aop

import org.aspectj.lang.ProceedingJoinPoint
import org.aspectj.lang.annotation.After
import org.aspectj.lang.annotation.AfterReturning
import org.aspectj.lang.annotation.Around
import org.aspectj.lang.annotation.Aspect
import org.aspectj.lang.annotation.Before
import org.aspectj.lang.annotation.Pointcut
import org.springframework.core.annotation.Order

@Aspect
@Order(-1)
class VoResultAop<T> {
	
	// execution( public * com.oks.web..*(..))
	// com.oks.web包路径下任意子包..表示所有类
	// *(..)表示所有方法
	@Pointcut(value="execution( public * com.oks.web..*(..))")
	def voPoint() {}
	
	
//	@Before(value="voPoint()")
//	def before() {}
//	
//	@After(value="voPoint()")
//	def after() {}
//	
//	@Around(value="voPoint()")
//	def around(ProceedingJoinPoint proceedingJoinPoint) {}
//	
//	@AfterReturning(value="voPoint()",returning="result")
//	def afterRerurning(T result) {}
	
}