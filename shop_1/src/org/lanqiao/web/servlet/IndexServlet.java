package org.lanqiao.web.servlet;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lanqiao.entity.Product;
import org.lanqiao.service.ProductService;
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService productService = new ProductService();
		//准备热门商品---List<Product>
		List<Product> hotProductList = productService.findHotProductList();
		
		//准备最新商品---List<Product>
		List<Product> newProductList = productService.findNewProductList();
		
		//准备分类数据
		//List<Category> categoryList = service.findAllCategory();
		
		//request.setAttribute("categoryList", categoryList);
		request.setAttribute("hotProductList", hotProductList);
		request.setAttribute("newProductList", newProductList);
		
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
