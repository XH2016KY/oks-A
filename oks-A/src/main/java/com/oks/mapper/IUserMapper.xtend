package com.oks.mapper

import com.oks.pojo.User
import org.apache.ibatis.annotations.Param
import java.util.List

interface IUserMapper {
	
	
	def User findByName(@Param("user")User user)
	
	
	def boolean register(@Param("user")User user)
	
	def List<User> findAll();
	
}