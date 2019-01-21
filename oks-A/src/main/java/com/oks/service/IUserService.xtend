package com.oks.service

import com.oks.pojo.User
import java.util.List

interface IUserService {
	
	def User findByName(User user)
	
	def boolean register(User user)
	
	def List<User> findAll()
	
}