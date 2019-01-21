package test

import com.oks.config.RootConfig
import com.oks.mapper.IProductMapper
import com.oks.mapper.IUserMapper
import com.oks.pojo.Product
import com.oks.pojo.User
import com.oks.service.IUserService
import org.junit.Before
import org.junit.Test
import org.springframework.context.ApplicationContext
import org.springframework.context.annotation.AnnotationConfigApplicationContext

class TestMapper {
	
	public ApplicationContext applicationContext
	
	@Before
	def void init(){
		applicationContext = new AnnotationConfigApplicationContext(RootConfig)
	}
	
	@Test
	def void test1() {
		val userMapper = applicationContext.getBean(IUserMapper)
		var u = new User
		u.name = "qwe"
		val findByName = userMapper.findByName(u)
		print(findByName)
	}
	
	@Test
	def void test2() {
		val userMapper = applicationContext.getBean(IUserMapper)
		var u = new User
		u.name = "sss"
		u.password="nnnnnn"
		val register = userMapper.register(u)
		print(register)
	}
	
	@Test
	def void test3() {
		val userService = applicationContext.getBean(IUserService)
		print(userService.class.name)
	}
	
	@Test
	def void test4() {
		val userMapper = applicationContext.getBean(IUserMapper)
		val findAll = userMapper.findAll
		println(findAll)
	}
	
	@Test
	def void test5() {
		val productMapper = applicationContext.getBean(IProductMapper)
		val updateQuatity = productMapper.updateQuatity(200)
		print(updateQuatity)
	}
	
	@Test
	def void test6() {
		val productMapper = applicationContext.getBean(IProductMapper)
		val updateQuatity = productMapper.selectCount
		print(updateQuatity)
	}
}