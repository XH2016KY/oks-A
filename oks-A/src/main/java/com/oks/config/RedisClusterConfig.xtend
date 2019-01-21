package com.oks.config

import com.oks.utils.DESUutil
import redis.clients.jedis.JedisCluster
import org.springframework.beans.factory.annotation.Value
import java.util.HashSet
import redis.clients.jedis.HostAndPort
import org.springframework.context.annotation.Bean
import redis.clients.jedis.JedisPoolConfig
import org.springframework.core.env.Environment
import org.springframework.context.EnvironmentAware
import com.oks.annotation.RedisConfig

@RedisConfig
class RedisClusterConfig implements EnvironmentAware{
	@Value("${redis-node1}")
	String redisNode;
	
	@Value("${redis-port1}")
    String port1;
	
	@Value("${redis-port2}")
	String port2;
	
	@Value("${redis-port3}")
	String port3;
	
	@Value("${redis-port4}")
	String port4;
	
	@Value("${redis-port5}")
	String port5;
	
	@Value("${redis-port6}")
	String port6;
	
	@Bean
    def jedisPoolConfig() {
		var jedisPoolConfig = new JedisPoolConfig();
		jedisPoolConfig.maxIdle=1000
		jedisPoolConfig;
		
	}
	
	@Bean
	def JedisCluster jedisCluster() {
		
		var set= new HashSet
		var r1 = new HostAndPort(DESUutil.getDecryptString(redisNode), Integer.parseInt(DESUutil.getDecryptString(port1)))
		var r2 = new HostAndPort(DESUutil.getDecryptString(redisNode), Integer.parseInt(DESUutil.getDecryptString(port2)))
		var r3 = new HostAndPort(DESUutil.getDecryptString(redisNode), Integer.parseInt(DESUutil.getDecryptString(port3)))
		var r4 = new HostAndPort(DESUutil.getDecryptString(redisNode), Integer.parseInt(DESUutil.getDecryptString(port4)))
		var r5 = new HostAndPort(DESUutil.getDecryptString(redisNode), Integer.parseInt(DESUutil.getDecryptString(port5)))
		var r6 = new HostAndPort(DESUutil.getDecryptString(redisNode), Integer.parseInt(DESUutil.getDecryptString(port6)))
		set.add(r1)
		set.add(r2)
		set.add(r3)
		set.add(r4)
		set.add(r5)
		set.add(r6)
		var j = jedisPoolConfig();
		new JedisCluster(set, j);
		
	}
	
	override setEnvironment(Environment environment) {
		 var projectName =environment.getProperty("redis-node1");
         System.out.println(projectName);
	}

}