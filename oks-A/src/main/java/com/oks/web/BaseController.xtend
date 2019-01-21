package com.oks.web

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.ResponseBody
import com.oks.eums.ResponseCode

@Controller
class BaseController {
	
	@RequestMapping(value="base",method=RequestMethod.GET)
	@ResponseBody
	def ok() {
		
		var map = #[1->"oks",2->"oop",3->"poi"]
		ServerRespose::SuccessOfOK(ResponseCode.OK.code,map)
	}
	
}