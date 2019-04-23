<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员登录</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
	width: 100%;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
</style>
</head>

<body>
	

	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>
	

	<div class="row" style="width: 1210px; margin: 0 auto;" id="pageBean">
	<%-- 	<div class="col-md-12">
			<ol class="breadcrumb">
				<li><a href="index.jsp">首页</a></li>
			</ol>
		</div>
		<c:forEach items="${pageBean.list }" var="pro">
		
			<div class="col-md-2" style="height:250px">
				<a href="${pageContext.request.contextPath }/ProductServlet?method=productInfo&pid=${pro.pid}&cid=${cid}&currentPage=${pageBean.currentPage}"> 
					<img src="${pageContext.request.contextPath }/${pro.pimage}" width="170" height="170" style="display: inline-block;">
				</a>
				<p>
					<a href="${pageContext.request.contextPath }/ProductServlet?method=productInfo&pid=${pro.pid}&cid=${cid}&currentPage=${pageBean.currentPage}" style='color: green'>${pro.pname }</a>
				</p>
				<p>
					<font color="#FF0000">商城价：&yen;${pro.shop_price }</font>
				</p>
			</div>
		
		</c:forEach> --%>
		

	</div>

	<!--分页 -->
	<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
		<ul class="pagination" style="text-align: center; margin-top: 10px;" id="page">
		</ul>	
	</div>
	<!-- 分页结束 -->

	<!--商品浏览记录-->
	<div
		style="width: 1210px; margin: 0 auto; padding: 0 9px; border: 1px solid #ddd; border-top: 2px solid #999; height: 246px;">

		<h4 style="width: 50%; float: left; font: 14px/30px 微软雅黑">浏览记录</h4>
		<div style="width: 50%; float: right; text-align: right;">
			<a href="">more</a>
		</div>
		<div style="clear: both;"></div>

		<div style="overflow: hidden;">

			<ul style="list-style: none;">
				<li
					style="width: 150px; height: 216; float: left; margin: 0 8px 0 0; padding: 0 18px 15px; text-align: center;"><img
					src="products/1/cs10001.jpg" width="130px" height="130px" /></li>
			</ul>

		</div>
	</div>


	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>
	
	
	<script type="text/javascript">
		//footer.jsp加载完毕后 去服务器端获得商品列表数据
		
		$(function(){
			var cid = getUrlParam('cid');
			var currentPage = getUrlParam('currentPage');
			var content = "";
			var Lastpage = "";
			var everyPage = "";
			var nextPage = "";
			var url = "${pageContext.request.contextPath}/ProductServlet?method=productList&cid=" +cid;
			if(currentPage != null) {
				url = url + "&currentPage=" + currentPage;
			}
	
			$.post(      //ajax加载
				url,
				function(data) {
					//动态创建html语言
					content+="<div class='col-md-12'><ol class='breadcrumb'><li><a href='index.jsp'>首页</a></li></ol></div>";
		     		for(var i=0;i<data.list.length;i++){
		     
						var href = " href='${pageContext.request.contextPath}/ProductServlet?method=productInfo&pid="
							+data.list[i].pid+"&cid="+data.list[i].cid+"&currentPage="+data.currentPage + "' ";
						content+="<div class='col-md-2' style='height:250px'><a" + href + "><img src='${pageContext.request.contextPath }/" + data.list[i].pimage
							+ "' width='170' height='170' style='display: inline-block;'></a><p><a" + href
							+ "style='color: green'>" + data.list[i].pname + "</a></p><font color='#FF0000'>商城价：&yen;"
							+ data.list[i].shop_price + "</font></p></div>"; 
						
					}
						
					$("#pageBean").html(content);
					if(data.currentPage === 1) {
						lastPage = "<li class='disabled'><a href='javascript:void(0);' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
					} else {
						lastPage = "<li><a  aria-label='Previous' href='product_list.jsp?cid="+cid+"&currentPage=" + (parseInt(currentPage)-1) + "'>"
							+ "<span aria-hidden='true'>&laquo;</span>" + "</a></li>";
					}
					$("#page").append(lastPage);
					for(var i = 1;i<data.totalPage+1;i++) {
						if(i === data.currentPage) {
							everyPage="<li class='active'><a href='javascript:void(0);'>"+i+"</a></li>";
							$("#page").append(everyPage);
						} else {
							everyPage="<li><a href='product_list.jsp?cid="+ data.list[0].cid +"&currentPage=" + 
								i + "'>"+i+"</a></li>";
							$("#page").append(everyPage);
						}
					}
					if(data.currentPage === data.totalPage) {
						nextPage = "<li class='disabled'><a href='javascript:void(0);' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
						
					} else {
						nextPage = "<li><a  aria-label='Next' href='product_list.jsp?cid="+cid+"&currentPage=" + (parseInt(currentPage)+1) + "'>"
						+ "<span aria-hidden='true'>&raquo;</span>" + "</a></li>";
						
					}
					$("#page").append(nextPage);
				},
				"json"
			);
			
		});
		
	
		function getUrlParam(name) {
		     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		     var r = window.location.search.substr(1).match(reg);//search,查询 ?后面的参数并匹配正则
		     if(r!=null)return  unescape(r[2]); return null;
		}
		
	</script>
</body>

</html>