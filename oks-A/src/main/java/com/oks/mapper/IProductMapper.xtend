package com.oks.mapper

import org.apache.ibatis.annotations.Param
import com.oks.pojo.Product

interface IProductMapper {
	
	
	def boolean updateQuatity(@Param("count")Integer count);
	
	
	def Integer selectCount();
	
}