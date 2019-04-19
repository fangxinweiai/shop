package org.lanqiao.test.service;

import org.junit.Test;
import org.lanqiao.service.UserService;

public class UserServiceTest {
	//校验用户名是否存在
	@Test
	public void checkUsernameTest() {
		UserService userService = new UserService();
		
		System.out.println(userService.checkUsername("ccc"));
	}

}
