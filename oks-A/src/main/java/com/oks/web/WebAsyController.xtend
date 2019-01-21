package com.oks.web

import org.springframework.stereotype.Controller
import org.apache.logging.log4j.LogManager
import org.apache.logging.log4j.Logger
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import java.util.concurrent.Callable
import org.springframework.web.bind.annotation.ResponseBody
import java.util.Date
import org.springframework.web.context.request.async.WebAsyncTask
import com.oks.annotation.WebLog4j2
import com.oks.utils.ThreadPoolUtil
import org.springframework.http.ResponseEntity
import org.springframework.web.client.RestTemplate

@Controller
@WebLog4j2
class WebAsyController {

	val static Logger log = LogManager.getLogger(WebAsyController)

	/** 线程池 */
	val pool = ThreadPoolUtil::createPool(4, 8, 60L)

	@RequestMapping(value="/webcallable", method=RequestMethod.GET, produces="application/json;charset=utf-8")
	@ResponseBody
	def callable() {

		val Callable<String> callable = [|
			var st = new Date().time
			log.info("副线程开始")
			Thread.sleep(3000L)
			log.info("副线程用时处理开始->{}", new Date().time - st)
			return "GG O尼玛"
		]
		callable
	// throw new RuntimeException("run----")
	}

	@RequestMapping(value="/webasy", method=RequestMethod.GET, produces="application/json;charset=utf-8")
	@ResponseBody
	def asy() {

		var task = new WebAsyncTask<String>([|
			var st = new Date().time
			log.info("副线程开始")
			Thread.sleep(3000L)
			log.info("副线程用时处理开始->{}", new Date().time - st)
			return "webtask O尼玛"
		])
		task
	// 匿名内部类外部是访问不到内部的信息的
	// ServerRespose::SuccessOfOK(200,task)
	}

	@RequestMapping(value="/runtime", method=RequestMethod.GET, produces="application/json;charset=utf-8")
	@ResponseBody
	def oks() {
		throw new RuntimeException("gg")
	}

	@RequestMapping(value="/listen", method=RequestMethod.GET, produces="application/json;charset=utf-8")
	@SuppressWarnings(value=#["unchecked", "rawtypes", "deprecated"])
	def listen() {
//          val ListenableFuture<ResponseEntity<String>> listen= new AsyncRestTemplate().
//		         getForEntity("http://localhost:8080/oks-A/webcallable",String)
		val ResponseEntity<String> listen = new RestTemplate().getForEntity(
			"http://localhost:8080/oks-A/webcallable", String)
		listen
	}

}
