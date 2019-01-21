package com.oks.utils

class Tool {
	
	def static void main(String[] args) {
		val Runnable r = [|
			println("GG")
		]
		
		// 开启新线程
		new Thread(r).start
		
		// 在主线程中
		r.run
		
		r().run
		
	
	}
	
	def static Runnable r() {
		[|
			println("666")
		]
	}
	
}