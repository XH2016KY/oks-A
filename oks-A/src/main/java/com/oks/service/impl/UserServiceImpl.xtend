package com.oks.service.impl

import com.oks.pojo.User
import com.oks.service.IUserService
import org.springframework.stereotype.Service
import com.oks.mapper.IUserMapper

@Service("userService")
class UserServiceImpl implements IUserService{
	
    final IUserMapper userMapper
    
    new(IUserMapper userMapper){
    	this.userMapper = userMapper
    }
	
	override findByName(User user) {
		userMapper.findByName(user)
	}
	
	override register(User user) {
		userMapper.register(user)
	}
	
	override findAll() {
		userMapper.findAll
	}
	
}