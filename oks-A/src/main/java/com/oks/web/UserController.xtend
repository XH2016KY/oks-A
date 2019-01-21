package com.oks.web

import com.oks.pojo.User
import com.oks.service.IUserService
import javax.servlet.http.HttpSession
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.beans.factory.annotation.Autowired
import org.apache.logging.log4j.Logger
import org.apache.logging.log4j.LogManager
import org.springframework.web.context.request.async.DeferredResult
import java.util.Date
import java.util.List
import redis.clients.jedis.JedisCluster
import java.util.concurrent.ThreadPoolExecutor
import java.util.concurrent.TimeUnit
import java.util.concurrent.LinkedBlockingDeque

@Controller
class UserController {
	
	/** 日志 */
	static final Logger log = LogManager.getLogger(UserController)
	/** 线程池 */
	val  pool = new ThreadPoolExecutor(3,5,60,TimeUnit.SECONDS,new LinkedBlockingDeque(200))
	
	@Autowired
	IUserService userService
	
	@Autowired
	JedisCluster jedisCluster
	
	/**
	 *  登录接口
	 */
	@RequestMapping(value="login",method=RequestMethod.POST)
	@ResponseBody
	def login(@RequestBody User user,HttpSession session) {
		
		if (userService.findByName(user)===null) 
		ServerRespose::FailOfError(500) 
		else null
	}
	
	
	/**
	 * 注册接口 
	 */
	 @RequestMapping(value="register",method=RequestMethod.POST)
	 @ResponseBody
	 def register(User user,HttpSession session){
	 	log.info("用户名->{}",user.name)
	 	log.info("用户密码->{}",user.password)
	 	// MD5加密password
	 	if (userService.register(user))
	 	ServerRespose::SuccessOfOK(200)
	 	else
	 	ServerRespose::FailOfError(404)
	 }
	 
	 /**
	  *  异步查询
	  */     
     @RequestMapping(value="result",method=RequestMethod.GET,produces="application/json;charset=utf-8")
	 @ResponseBody
     def deferResult(){
     	log.info("主线程")
     	var l1 = new Date().time
     	var result = new DeferredResult<String>(7*1000L,"超时了");
     	work(result)
     	var l2 = new Date().time-l1
     	log.info("主线程用时:{}",l2)
     	result
     }
	
	def work(DeferredResult<String> result) {
		var r = new Runnable(){
			
			override run() {
				var l1 = new Date().time
		        log.info("副线程开始")
				Thread.sleep(6*1000L)
				result.result = "GG" + "交定金"
				var l2 = new Date().time-l1
				log.info("副线程用时:{}",l2)
			}	
		}	
		new Thread(r).start
	}
   
   /** 
    *  异步查询服务
    */
   @RequestMapping(value="findAll",method=RequestMethod.GET)
   @ResponseBody
    def findAll(){
        log.info("主线程")
     	var l1 = new Date().time
    	var result = new DeferredResult<List<User>>(10*1000L,"超时了");
    	find(result)
    	var l2 = new Date().time-l1
		log.info("主线程用时:{}",l2)
    	result
    }
	
	def find(DeferredResult<List<User>> result) {
		var r = new Runnable(){
			
			override run() {
				var l1 = new Date().time
		        log.info("副线程开始")
		        //Thread.sleep(3*1000L)
				result.result=userService.findAll
				var l2 = new Date().time-l1
				log.info("副线程用时:{}",l2)
			}
		}
		//new Thread(r).start
		pool.execute(r)
	}
	
	/**
	 *  redis集群测试
	 */
	@RequestMapping(value="redis",method=RequestMethod.GET)
    @ResponseBody
	def redis() {
		jedisCluster.get("gg:zz:bb")
		jedisCluster.hdel("gg","name")
	}
	
}