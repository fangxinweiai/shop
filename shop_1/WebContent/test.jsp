<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
<ul>
	<li><button style='cursor:hand;' type='button' action='product_list.jsp?cid=1&currentPage=2' aria-label='Previous' id='lastPage'>
	<span aria-hidden='true'>&laquo;</span></button></li>
</ul>
</body>
	<script type="text/javascript">
		$("#lastPage").click(function(){
			var url = $(this).attr("action");
			console.log(url);
			console.log("adsadasdasdsa231321'']]]'");
		});
	</script>
</html>