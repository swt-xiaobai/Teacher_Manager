<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更改密码</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/fontawesome.min.css">
</head>
<body class="login">
	<div class="top">
		&nbsp &nbsp <span style="color:#ffffff;font-size:40px;">  教师管理系统</span>
	</div>
	<div class = "center">
		<p style="position: fixed;">
		&nbsp &nbsp<a href="index.jsp">返回</a>
		</p>
		<br>
		<P style="font-size:30px">输入您要更改的账号:</P>
		<div style="color:red"><%=request.getParameter("error") %></div>
		<form action="changePassword" method="post">
			您的姓名:<input type="text" name="name" style="width:100px"/>
			年龄	:<input type="text" name="age" style="width:50px"/><br>
			账号:<input type="text" name="account" style="width:200px"/><br>
			新密码:<input type="password" name="newpassword"style="width:185px"/><br>
			<input type="hidden" name="where" value="Login_2.jsp"/>
			<input type="submit" value="提交"class="button"id="submit" style="width:200px"/>
		</form>
			
	</div>

</body>
</html>