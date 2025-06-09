<%@page import="java.util.List"%>
<%@page import="com.sss.users.course"%>
<%@ page import="com.sss.sql.SqlServer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>授课查询</title>
<link rel="stylesheet" href="mian.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/fontawesome.min.css">
</head>
<body class="page">
<div class="top">
		<span class="daohang">
		  <span style="color:#ffffff;font-size:40px;">  教师管理系统</span>
			<a href="homePage.jsp" style = "text-decoration:none"><i class="fas fa-smile" /></i>我的信息</a>
			<a href="T_course.jsp" style = "text-decoration:none"><i class="fas fa-book" ></i>授课查询</a>
			<a href="Login_1.jsp" style = "text-decoration:none"><i class="fas fa-user-circle" ></i><%=session.getAttribute("user")%>:退出</a> 
		</span>
</div>

<form action="T_course.jsp" >
学期:<select name="when" style="width:200px">
				<option value="">全部</option>
		 		<option value="2025-2026上">2025-2026上</option>
		 		<option value="2025-2026下">2025-2026下</option> 
		 		<option value="2026-2027上">2026-2027上</option> 
		 		<option value="2026-2027下">2026-2027下</option> 
</select>
<button type="submit" class="button" id="submit">
  <i class="fas fa-search"></i> 查询
</button>
<!-- <input type="submit" value="查询"class="button"id="submit" /> -->
</form>

<table >
	<%
	String name =(String) session.getAttribute("user");
	String when =request.getParameter("when");
	
	try{
		List<course> list = SqlServer.getC();
	
	%>
		<thead>
			<tr>
				<th>课程名</th>
				<th>学期时间</th>
				<th>授课教师</th>
				<th>课时</th>
			</tr>
		</thead>
		<tbody>
		<%
			for (course y : list ){
				if(y.getTeacher().equals(name)){
					if(when==null|| when.equals("")||y.getTime().equals(when)){
				%>
					<tr>
						<td><%= y.getName()%></td>
						<td><%=y.getTime() %></td>
						<td><%=y.getTeacher() %></td>
						<td><%=y.getClassTime() %></td>
					</tr>
				<% 
					}
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