package com.oks.initalizer

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer
import com.oks.config.RootConfig
import com.oks.config.WebConfig
import org.springframework.web.filter.CharacterEncodingFilter
import javax.servlet.Filter
import org.springframework.context.annotation.ImportResource

//@ImportResource("WEB-INF/web.xml")
class WebAppInitalizer extends AbstractAnnotationConfigDispatcherServletInitializer{
	
	/**
	 * spring-root容器
	 */
	override protected getRootConfigClasses() {
		var Class<?>[] root = #[RootConfig]
		root
	}
	
	/**
	 * spring-mvc容器
	 */
	override protected getServletConfigClasses() {
		var Class<?>[] web = #[WebConfig]
		web
	}
	
	/**
	 * servlet-path
	 */
	override protected getServletMappings() {
		var String[] path= #["/"]
		path
	}
	
	/**
	 * 注册过滤器
	 */
	override protected getServletFilters(){
		
		var characterEncodingFilter = new CharacterEncodingFilter
		characterEncodingFilter.encoding="UTF-8"
		characterEncodingFilter.forceEncoding = true
		
//		var log4j2Filter = new Log4jServletFilter
		val Filter[] filter = #[characterEncodingFilter]
		filter
		
	}
	
	/**
	 *  注册监听器----->会导致AutoWired注入失败
	 */
//	override protected registerContextLoaderListener(ServletContext servletContext) {
////		var log = new Log4jServletContextListener
////		servletContext.addListener(log)
//		
//	}
	
}