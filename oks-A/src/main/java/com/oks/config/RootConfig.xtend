package com.oks.config

import org.springframework.context.annotation.ComponentScan
import org.springframework.context.annotation.ComponentScan.Filter
import org.springframework.context.annotation.EnableAspectJAutoProxy
import org.springframework.context.annotation.FilterType
import org.springframework.context.annotation.ImportResource
import org.springframework.stereotype.Component
import org.springframework.stereotype.Service
import com.oks.annotation.RedisConfig

@ComponentScan(value = "com.oks.*",includeFilters = #[
		@Filter(type=FilterType.ANNOTATION,classes= #[
				Service,Component,RedisConfig])
])
@EnableAspectJAutoProxy
//@ImportResource(#["classpath:spring/spring-dao.xml","classpath:spring/spring-redis-cluster.xml"])
@ImportResource(#["classpath:spring/spring-dao.xml"])
class RootConfig {
	
}