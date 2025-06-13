<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.sss.Dao.TeacherDao"%>
<%@page import="java.util.List"%>
<%@page import="com.sss.users.user"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员主页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/fontawesome.min.css">
</head>
<body class="page">

<div class="top">
		<span class="daohang">
		  <span style="color:#ffffff;font-size:40px;">  教师管理系统</span>
			<a href="homePage2.jsp" style = "text-decoration:none"><i class="fas fa-user" /></i>教师查询</a>
			<a href="T_course2.jsp" style = "text-decoration:none"><i class="fas fa-book-open" /></i>授课查询</a>
			<a href="index.jsp" style = "text-decoration:none"><i class="fas fa-user-edit" /></i>管理员:退出</a>
		</span>
</div>
<div style="text-align:center">
<form action="homePage2.jsp"  >
教师:<input type="text" name="Cname" placeholder="按名字查询"/>
<button type="submit" class="button" id="submit">
  <i class="fas fa-search"></i> 查询
</button>
<!-- <input type="submit" value="查询"class="button"id="submit" /> -->
</form>

</div>
<table>
	<%
	
	String name =request.getParameter("Cname");
	
	try{
		List<user> list = TeacherDao.getT();
	
	%>
		<thead>
			<tr>
				<th>教师姓名</th>
				<th>性别</th>
				<th>年龄</th>
				<th>职位</th>
				<th>详情</th>
			</tr>
		</thead>
		<tbody>
		<%
			for (user y : list ){
					if(name==null|| name.equals("")||y.getName().equals(name)){
				%>
					<tr>
						<td><%= y.getName()%></td>
						<td><%=y.getSex() %></td>
						<td><%=y.getAge() %></td>
						<td><%=y.getDer() %></td>
						<td>
							<a href="information.jsp?account=<%=y.getAccount()%> ">查看详情</a>
						</td>
					</tr>
				<% 
				
			}
		}
		%>	
		</tbody>
		
	<%
	}
	catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	%>
	
	</table>
	
	
</body>
</html> 