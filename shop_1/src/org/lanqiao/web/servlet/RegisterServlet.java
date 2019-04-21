package org.lanqiao.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;
import org.lanqiao.entity.User;
import org.lanqiao.service.UserService;
import org.lanqiao.utils.CommonsUtils;
import org.lanqiao.utils.MailUtils;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//获得表单数据
		Map<String, String[]> properties = request.getParameterMap();
		User user = new User();
		try {
			//自己指定一个类型转换器（将String转成Date）
			ConvertUtils.register(new Converter() {
				@Override
				public Object convert(Class clazz, Object value) {
					//将string转成date
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					Date parse = null;
					try {
						parse = format.parse(value.toString());
					} catch (ParseException e) {
						e.printStackTrace();
					}
					return parse;
				}
			}, Date.class);
			//映射封装
			BeanUtils.populate(user, properties);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//private String uid;
		user.setUid(CommonsUtils.getUUID());
		//private int state;//是否激活
		user.setState(0);
		//private String code;//激活码
		String activeCode = CommonsUtils.getUUID();
		user.setCode(activeCode);
		//将user传递给service层
		UserService userService = new UserService();
		boolean isRegisterSuccess = userService.regist(user);
		
		//是否注册成功
		if(isRegisterSuccess){
			//发送激活邮件
			String emailMsg = "恭喜您注册成功，请点击下面的连接进行激活账户"
					+ "<a href='http://localhost:8080/shop_1/ActiveServlet?activeCode="+activeCode+"'>"
					+ "http://localhost:8080/shop_1/active?activeCode="+activeCode+"</a>";
			boolean isSend = MailUtils.sendMail(user.getEmail(), emailMsg);
			if(isSend) {
				//跳转到注册成功页面
				response.sendRedirect(request.getContextPath()+"/registerSuccess.jsp");
			} else {
				//跳转到失败的提示页面
				System.out.println("邮箱验证失败");
				response.sendRedirect(request.getContextPath()+"/registerFail.jsp");
			}
		}else{
			//跳转到失败的提示页面
			System.out.println("注册失败");
			response.sendRedirect(request.getContextPath()+"/registerFail.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
