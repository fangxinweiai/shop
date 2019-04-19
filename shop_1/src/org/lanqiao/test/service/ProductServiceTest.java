package org.lanqiao.test.service;

import java.util.List;

import org.junit.Test;
import org.lanqiao.entity.Product;
import org.lanqiao.service.ProductService;

public class ProductServiceTest {
	@Test
	public void findHotProductListTest() {
		ProductService productService = new ProductService();
		List<Product> hotProductList = productService.findHotProductList();
		System.out.println(hotProductList);
	}
}
