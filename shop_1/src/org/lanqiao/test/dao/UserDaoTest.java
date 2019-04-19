package org.lanqiao.test.dao;

import java.sql.SQLException;

import org.junit.Test;
import org.lanqiao.dao.UserDao;
import org.lanqiao.entity.User;

public class UserDaoTest {
	@Test
	public void checkUsernameTest() throws SQLException {
		UserDao userDao = new UserDao();
		User user = userDao.checkUsername("ccc");
		System.out.println(user);
	}
}
