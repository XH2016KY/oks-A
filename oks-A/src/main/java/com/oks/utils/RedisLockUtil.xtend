package com.oks.utils

import redis.clients.jedis.JedisCluster

/**
 *  redis分布式锁
 */
class RedisLockUtil {
	
	/**
	 *  测试加锁
	 */
	def static boolean  tryLock(JedisCluster jedisCluster,String key,String value,Long ttl) {
		var result = jedisCluster.set(key,value,"NX","EX",ttl);		
		return "OK".equals(result)
	}
	
	
	/**
	 *  释放锁
	 */
	def static boolean releaseLock(JedisCluster jedisCluster,String key,String value) {
		// 自己加的锁自己去释放
		if(value.equals(jedisCluster.get(key))){
			return jedisCluster.del(key)>0
		}
		return false
	}
}