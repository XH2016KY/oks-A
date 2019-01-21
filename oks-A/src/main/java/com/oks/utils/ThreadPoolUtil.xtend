package com.oks.utils

import java.util.concurrent.TimeUnit
import java.util.concurrent.LinkedBlockingDeque
import java.util.concurrent.ThreadPoolExecutor

class ThreadPoolUtil {
	
	
	def static createPool(Integer work,Integer captity,Long timeOut) {
		new ThreadPoolExecutor(work, captity, timeOut, TimeUnit.SECONDS, new LinkedBlockingDeque(200))
	}
}