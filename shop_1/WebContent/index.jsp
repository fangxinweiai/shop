<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>蓝桥商城首页</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
	</head>

	<body>
		<div class="container-fluid">

			<!-- 引入header.jsp -->
			<jsp:include page="/header.jsp"></jsp:include>

			<!-- 轮播图 -->
			<div class="container-fluid">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- 轮播图的中的小点 -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>
					<!-- 轮播图的轮播图片 -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="img/1.jpg">
							<div class="carousel-caption">
								<!-- 轮播图上的文字 -->
							</div>
						</div>
						<div class="item">
							<img src="img/2.jpg">
							<div class="carousel-caption">
								<!-- 轮播图上的文字 -->
							</div>
						</div>
						<div class="item">
							<img src="img/3.jpg">
							<div class="carousel-caption">
								<!-- 轮播图上的文字 -->
							</div>
						</div>
					</div>

					<!-- 上一张 下一张按钮 -->
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			
			<!-- 热门商品 -->
			<div class="container-fluid">
				<div class="col-md-12">
					<h2>热门商品&nbsp;&nbsp;<img src="img/title2.jpg"/></h2>
				</div>
				<div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">
					<img src="products/hao/big01.jpg" width="205" height="404" style="display: inline-block;"/>
				</div>
				<div class="col-md-10" id="hotProductList">
					<div class="col-md-6" style="text-align:center;height:200px;padding:0px;">
						<a href="javascript:void(0);">
							<img src="products/hao/middle01.jpg" width="500px" height="200px" style="display: inline-block;">
						</a>
					</div>
				<%-- 	<c:forEach items="${hotProductList}" var="hotPro">
						<div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;">
							<a href="product_info.jsp">
								<img src="${pageContext.request.contextPath}/${hotPro.pimage}" width="130" height="130" style="display: inline-block;">
							</a>
							<p><a href="product_info.jsp" style='color:#666'>${hotPro.pname}</a></p>
							<p><font color="#E4393C" style="font-size:16px">&yen;${hotPro.shop_price }</font></p>
						</div>
					</c:forEach> --%>
				</div>
			</div>
			<br/>
			<!-- 广告条 -->
            <div class="container-fluid">
				<img src="products/hao/ad.jpg" width="100%"/>
			</div>
			
			<!-- 最新商品 -->
			<div class="container-fluid">
				<div class="col-md-12">
					<h2>最新商品&nbsp;&nbsp;<img src="img/title2.jpg"/></h2>
				</div>
				<div class="col-md-2" style="border:1px solid #E7E7E7;border-right:0;padding:0;">
					<img src="products/hao/big01.jpg" width="205" height="404" style="display: inline-block;"/>
				</div>
				<div class="col-md-10" id="newProductList">
					<div class="col-md-6" style="text-align:center;height:200px;padding:0px;" >
						<a href="javascript:void(0);">
							<img src="products/hao/middle01.jpg" width="500px" height="200px" style="display: inline-block;">
						</a>
					</div>
					
					<%-- <div class="col-md-2" style="text-align:center;height:200px;padding:10px 0px;" >
						<a href="product_info.jsp">
							<img src="${pageContext.request.contextPath}/${newPro.pimage}" width="130" height="130" style="display: inline-block;">
						</a>
						<p><a href="ProductServlet?method=productInfo&pid=${newPro.pid}&cid=${newPro.category.cid}" style='color:#666'>${newPro.pname}</a></p>
						<p><font color="#E4393C" style="font-size:16px">&yen;${newPro.shop_price}</font></p>
					</div> --%>
					
				</div>
			</div>			
			
			<!-- 引入footer.jsp -->
			<jsp:include page="/footer.jsp"></jsp:include>
			
			
			<script type="text/javascript">
			//footer.jsp加载完毕后 去服务器端获得所有的最热的商品数据
				$(function(){
					var content = "";
					$.post(      //ajax加载
						"${pageContext.request.contextPath}/ProductServlet?method=indexHotProducts",
	
						function(data) {
							//动态创建html语言
							for(var i=0;i<data.length;i++){
								var href = " href='ProductServlet?method=productInfo&pid=" + data[i].pid;
								content += "<div class='col-md-2' style='text-align:center;height:200px;padding:10px 0px;'>"
						+"<a" + href +"'><img src='${pageContext.request.contextPath}/" + data[i].pimage + "' width='130' height='130' style='display: inline-block;'></a>"
						+"<p><a" + href + "' style='color:#666'>" + data[i].pname + "</a></p><p><font color='#E4393C' style='font-size:16px'>&yen;"
						+ data[i].shop_price + "</font></p></div>";
								//console.log(content);
							}
							
							$("#hotProductList").append(content);
						},
						"json"
					);
				});
				//footer.jsp加载完毕后 去服务器端获得所有的最新的商品数据
				$(function(){
					var content = "";
					$.post(    
						"${pageContext.request.contextPath}/ProductServlet?method=indexNewProducts",
						function(data){
							//动态创建html语言
							for(var i=0;i<data.length;i++){
								var href = " href='ProductServlet?method=productInfo&pid=" + data[i].pid;
								content += "<div class='col-md-2' style='text-align:center;height:200px;padding:10px 0px;'>"
						+"<a" + href +"'><img src='${pageContext.request.contextPath}/" + data[i].pimage + "' width='130' height='130' style='display: inline-block;'></a>"
						+"<p><a" + href + "' style='color:#666'>" + data[i].pname + "</a></p><p><font color='#E4393C' style='font-size:16px'>&yen;"
						+ data[i].shop_price + "</font></p></div>";
								//console.log(content);
							}
							
							$("#newProductList").append(content);
						},
						"json"
					);
				});
			</script>
		</div>
	</body>
	
</html>