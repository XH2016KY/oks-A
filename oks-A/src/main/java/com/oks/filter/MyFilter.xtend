package com.oks.filter

import javax.servlet.Filter
import javax.servlet.ServletRequest
import javax.servlet.ServletResponse
import javax.servlet.FilterChain
import java.io.IOException
import javax.servlet.ServletException
import javax.servlet.annotation.WebFilter

@WebFilter(filterName="myFilter",urlPatterns=#["/base"])
class MyFilter implements Filter{
	
	override doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		println("----------------------OKH1-------------------------")
		chain.doFilter(req,res)
		
	}
	
	
}