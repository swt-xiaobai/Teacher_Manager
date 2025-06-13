<%@page import="java.util.List"%>
<%@page import="com.sss.users.course"%>
<%@page import="com.sss.users.user"%>
<%@page import="com.sss.users.ct"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.sss.Dao.CourseDao" %>
<%@ page import="com.sss.Dao.CTDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>授课查询</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/fontawesome.min.css">
<style type="text/css">
	.add-course-btn {
    margin-top: 20px;
    display: inline-block;
    color: #3498db;
    text-decoration: none;
    font-weight: 600;
}

.add-course-btn i {
    margin-right: 5px;
    color: #3498db;
}




</style>
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

<form action="T_course2.jsp" style="text-align:center">
学期:<select name="when" style="width:100px">
				<option value="">全部</option>
		 		<option value="2025-2026上">2025-2026上</option>
		 		<option value="2025-2026下">2025-2026下</option> 
		 		<option value="2026-2027上">2026-2027上</option> 
		 		<option value="2026-2027下">2026-2027下</option> 
</select>
		
教师:<input type="text" name="name" style="width:100px" placeholder="全部"/>
<button type="submit" class="button" id="submit">
  <i class="fas fa-search"></i> 查询
</button>
<!-- <input type="submit" value="查询"class="button"id="submit" style="width:100px"/> --><br>
<!-- <a href="addC.jsp" style = "text-decoration:none">添加课程</a> -->
        <a href="addC.jsp" class="add-course-btn">
            <i class="fas fa-plus"></i> 添加课程
        </a>
</form>

<table >
	<%
	String name =request.getParameter("name");
	String when =request.getParameter("when");
	
	try{
		List<course> list = CourseDao.getC();
		List<ct> cts = CTDao.getCT();
	
	%>
		<thead>
			<tr>
				<th>课程名</th>
				<th>学期时间</th>
				<th>授课教师</th>
				<th>助教教师</th>
				<th>课时</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<%
			for (course y : list ){
				if(name==null|| name.equals("")||y.getTeacher().equals(name)){
					if(when==null|| when.equals("")||y.getTime().equals(when)){
				%>
					<tr>
						<td><%= y.getName()%></td>
						<td><%=y.getTime() %></td>
						<td><%=y.getTeacher() %><%=y.getTaccount() %></td>
						<td><%for(ct c :cts ){
							if(c.getName().equals(y.getName()))
								{
									%> 
									<%=c.getTeacher() %> 
									<%if(c.getSex().equals("男")) {
										%><i class="fas fa-male" /></i><%}
										else {%>
										<i class="fas fa-female" /></i>
										<%} %>
										&nbsp
									<%
								}
							
							
						}	%> </td>
						
						<td><%=y.getClassTime() %></td>
						<td>
							<a href="updataC.jsp?course=<%=y.getName() %>" style = "text-decoration:none">修改</a>
							<a href="deletecourse?where=T_course2.jsp&course=<%=y.getName() %>" style = "text-decoration:none">删除</a>
						</td>
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