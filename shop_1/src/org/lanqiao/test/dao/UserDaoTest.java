package org.lanqiao.test.dao;

import java.sql.SQLException;
import java.util.Date;

import org.junit.Test;
import org.lanqiao.dao.UserDao;
import org.lanqiao.entity.User;
import org.lanqiao.utils.CommonsUtils;

public class UserDaoTest {
	@Test
	public void checkUsernameTest() throws SQLException {
		UserDao userDao = new UserDao();
		User user = userDao.checkUsername("ccc");
		System.out.println(user);
	}
	@Test
	public void registTest() throws SQLException {
		UserDao userDao = new UserDao();
		User user = new User();
		user.setUid(CommonsUtils.getUUID());
		user.setUsername("ZS");
		user.setPassword("aaa");
		user.setEmail("ffff@qq.com");
		user.setBirthday(new Date());
		user.setSex("男");
		user.setState(0);
		user.setCode("xxaadadasd");
		System.out.println(userDao.regist(user));
	}
}
