package org.lanqiao.utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DataSourceUtils {
	private static DataSource dataSource = new ComboPooledDataSource();

	private static ThreadLocal<Connection> tl = new ThreadLocal<>();

	// 直接可以获取一个连接池
	public static DataSource getDataSource() {
		return dataSource;
	}

	// 获取连接对象
	public static Connection getConnection() throws SQLException {

		Connection connection = tl.get();
		if (connection == null) {
			connection = dataSource.getConnection();
			tl.set(connection);
		}
		return connection;
	}

	// 开启事务
	public static void startTransaction() throws SQLException {
		Connection connection = getConnection();
		if (connection != null) {
			connection.setAutoCommit(false);
		}
	}

	// 事务回滚
	public static void rollback() throws SQLException {
		Connection connection = getConnection();
		if (connection != null) {
			connection.rollback();
		}
	}

	// 提交并且 关闭资源及从ThreadLocall中释放
	public static void commitAndRelease() throws SQLException {
		Connection connection = getConnection();
		if (connection != null) {
			connection.commit(); // 事务提交
			connection.close();// 关闭资源
			tl.remove();// 从线程绑定中移除
		}
	}

	// 关闭资源方法
	public static void closeConnection() throws SQLException {
		Connection connection = getConnection();
		if (connection != null) {
			connection.close();
		}
	}

	public static void closeStatement(Statement statement) throws SQLException {
		if (statement != null) {
			statement.close();
		}
	}

	public static void closeResultSet(ResultSet resultSet) throws SQLException {
		if (resultSet != null) {
			resultSet.close();
		}
	}
}
