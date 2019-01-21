package com.oks.service.impl

import com.oks.service.IProductService
import org.springframework.stereotype.Service
import org.springframework.beans.factory.annotation.Autowired
import com.oks.mapper.IProductMapper
import org.springframework.transaction.annotation.Transactional

@Service("productService")
class ProductServiceImpl implements IProductService{
	
	
	@Autowired
	IProductMapper productMapper

	
	@Transactional
	override updateQuatity(Integer count) {
		productMapper.updateQuatity(count)
	}
	
	override selectCount() {
		productMapper.selectCount
	}
}