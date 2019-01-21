package com.oks.web

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import java.util.concurrent.CompletableFuture
import org.springframework.web.bind.annotation.ResponseBody
import com.oks.pojo.Item
import com.oks.pojo.Cart
import java.util.ArrayList
import org.apache.logging.log4j.LogManager
import org.apache.logging.log4j.Logger

@Controller
class AsyWebController {
	
	val static Logger log = LogManager.getLogger(AsyWebController)
	
	
	@RequestMapping(value="/asyfutrue")
	@ResponseBody
	def asy() {
		CompletableFuture.supplyAsync([|
			 "I am here"
		]).
		thenCombine(CompletableFuture.supplyAsync([|
			" with you"
		]),[ret,msg|
			ret + msg
		]).
		thenCompose([p|
			CompletableFuture.supplyAsync([|p+" and everyone"])
		])
	}
	
	
	@RequestMapping(value="/asycart")
	@ResponseBody
	def asycart() {
		
	
		log.info("主线程start")
		CompletableFuture.supplyAsync([|
			    log.info("得到商品")
				var a = new Item
		        a.id="001"
		        a.name="书"
                a        
		]).
		thenCombine(CompletableFuture.supplyAsync([|
			   log.info("将商品装入集合")
			   var list = new ArrayList
			   list
		]),[item,list|
			list.add(item)
			list
		]).
		thenCompose([p|
			log.info("将集合装入购物车")
			CompletableFuture.supplyAsync([|
				var c = new Cart
				c.cart = p
				c
			])
		])

	}
	
}