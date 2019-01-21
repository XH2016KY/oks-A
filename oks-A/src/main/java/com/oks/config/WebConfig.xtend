package com.oks.config

import org.springframework.web.servlet.config.annotation.WebMvcConfigurer
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry
import org.springframework.web.servlet.config.annotation.InterceptorRegistry
import org.springframework.context.annotation.ComponentScan
import org.springframework.context.annotation.EnableAspectJAutoProxy
import org.springframework.web.servlet.config.annotation.EnableWebMvc
import org.springframework.context.annotation.ComponentScan.Filter
import org.springframework.context.annotation.FilterType
import org.springframework.stereotype.Controller
import org.aspectj.lang.annotation.Aspect

@ComponentScan(value = "com.oks.*",includeFilters=#[
	@Filter(type = FilterType.ANNOTATION,classes=#[Controller,Aspect])
],useDefaultFilters=false)
@EnableAspectJAutoProxy
@EnableWebMvc
class WebConfig implements WebMvcConfigurer{
	
	/**
	 *  放行静态资源
	 */
	override configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable
	}
	
	/**
	 *  注册拦截器
	 */
	override addInterceptors(InterceptorRegistry registry) {
		WebMvcConfigurer.super.addInterceptors(registry)
	}
	
	/**
	 *  视图解析
	 */
	override configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("WEB-INF/views",".jsp")
	}
	
}