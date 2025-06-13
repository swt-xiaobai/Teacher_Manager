<%@page import="com.sss.users.ct"%>
<%@page import="java.util.List"%>
<%@page import="com.sss.users.user"%>
<%@page import="com.sss.users.course"%>
<%@ page import="com.sss.Dao.TeacherDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>教师添加课程</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/fontawesome.min.css">
<!-- 内部CSS样式 -->
<style>
/* 全局基础样式 */
body {
    font-family: 'Segoe UI', sans-serif;
    line-height: 1.6;
    color: #333;
    margin: 0;
    padding: 0;
    background: #f0f2f5;
}

/* 返回按钮样式 */
.return-btn {
    display: inline-block;
    margin: 2rem 5%;
    color: #2c3e50;
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s;
}

.return-btn i {
    margin-right: 5px;
    color: #3498db;
}

.return-btn:hover {
    color: #3498db;
}

/* 表格美化 */
.course-table {
    max-width: 1200px;
    margin: 0 auto 3rem;
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    overflow: hidden;
    width: 90%;
}

.course-table th,
.course-table td {
    padding: 14px 18px;
    text-align: left;
    border-bottom: 1px solid #f0f0f0;
}

.course-table th {
    background: #f8f9fa;
    font-weight: 600;
    color: #2c3e50;
    text-transform: uppercase;
    font-size: 0.95rem;
}

.course-table tr:hover {
    background: #f8faff;
}

.course-table td a {
    color: #3498db;
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s;
}

.course-table td a:hover {
    color: #2980b9;
}

/* 小屏幕适配 */
@media (max-width: 768px) {
    .course-table {
        width: 95%;
    }
    
    .course-table th,
    .course-table td {
        padding: 10px 12px;
        font-size: 0.9rem;
    }
}
</style>

</head>
<body class="page">

<!-- 保留原始top部分，不修改其样式 -->
<div class="top">
    <span class="daohang">
        <span style="color:#ffffff;font-size:40px;">  教师管理系统</span>
        <a href="homePage2.jsp" style="text-decoration:none"><i class="fas fa-user" /></i>教师查询</a>
        <a href="T_course2.jsp" style="text-decoration:none"><i class="fas fa-book-open" /></i>授课查询</a>
        <a href="index.jsp" style="text-decoration:none"><i class="fas fa-user-edit" /></i>管理员:退出</a>
    </span>
</div>

<%
String course = request.getParameter("course");
String account = request.getParameter("account");
if(account ==null ||account.equals("")){
    account =(String) session.getAttribute("Caccount");
}
%>

<!-- 添加return-btn类到返回按钮 -->
<a href="updataC.jsp" class="return-btn">
    <i class="fas fa-arrow-left"></i> 返回
</a>

<!-- 给表格添加course-table类 -->
<table class="course-table">
    <thead>
        <tr>
            <th>教师名称</th>
            <th>性别</th>
            <th>年龄</th>
            <th>账号</th>
            <th>职位</th>
            <th>详情</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
        <%
        try{
            List<user> list = TeacherDao.getT();
            for (user u : list ){
                if(!u.getAccount().equals(account) ){
                
        %>
        <tr>
            <td><%=u.getName()%></td>
            <td><%=u.getSex() %></td>
            <td><%=u.getAge() %></td>
            <td><%=u.getAccount() %></td>
            <td><%=u.getDer() %></td>
            <td><%=u.getDers() %></td>
            <td>
                <a href="addct?course=<%=course %>&teacher=<%=u.getName()%>&account=<%=u.getAccount() %>&sex=<%=u.getSex() %>&where=updataC.jsp">添加</a>  
            </td>
        </tr>
        <%     	
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </tbody>
</table>

</body>
</html>