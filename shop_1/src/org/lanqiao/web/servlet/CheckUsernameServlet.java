package org.lanqiao.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lanqiao.service.UserService;
@WebServlet("/CheckUsernameServlet")
public class CheckUsernameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得用户名
		String username = request.getParameter("username");
		
		UserService userService = new UserService();
		boolean isExist = userService.checkUsername(username);
		
		String json = "{\"isExist\":"+isExist+"}";
		
		response.getWriter().write(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
