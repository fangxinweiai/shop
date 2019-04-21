package org.lanqiao.test.dao;

import java.sql.SQLException;
import java.util.List;
import org.junit.Test;
import org.lanqiao.dao.ProductDao;
import org.lanqiao.entity.Product;

public class ProductDaoTest {
	@Test
	public void findNewProductListTest() throws SQLException {
		ProductDao productDao = new ProductDao();
		List<Product> products = productDao.findNewProductList();
		System.out.println(products);
	}
}
