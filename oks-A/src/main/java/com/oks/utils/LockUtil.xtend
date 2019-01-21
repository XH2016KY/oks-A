package com.oks.utils

import java.util.concurrent.locks.ReentrantLock

/**
 *  ReentrantLock 重入锁
 */
class LockUtil {
	
	def static createLock(){
		new ReentrantLock
	}
}