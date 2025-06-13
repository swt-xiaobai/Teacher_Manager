<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.sss.users.course"%>
<%@page import="com.sss.users.user"%>
<%@page import="com.sss.users.ct"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.sss.Dao.CourseDao" %>
<%@ page import="com.sss.Dao.TeacherDao" %>
<%@ page import="com.sss.Dao.CTDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改课程</title>
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
    padding: 20px 0;
    background: #f0f2f5;
}

/* 顶部导航栏阴影增强 */
.top {
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

/* 主体容器样式 */
.main-container {
    max-width: 800px;
    margin: 30px auto;
    background: #ffffff;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

/* 返回链接样式 */
.return-link {
    display: inline-block;
    margin-bottom: 20px;
    color: #2c3e50;
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s;
}

.return-link i {
    margin-right: 5px;
    color: #3498db;
}

.return-link:hover {
    color: #3498db;
}

/* 页面标题样式 */
.page-title {
    font-size: 2.2rem;
    color: #2c3e50;
    margin-bottom: 25px;
    border-bottom: 3px solid #3498db;
    padding-bottom: 10px;
}

/* 表单组样式 */
.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    font-size: 1.1rem;
    color: #555;
    margin-bottom: 8px;
}

.form-group input,
.form-group select {
    width: 100%;
    padding: 12px 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 1rem;
    transition: border-color 0.3s;
}

.form-group input:focus,
.form-group select:focus {
    border-color: #3498db;
    outline: none;
}

/* 下拉菜单自定义样式 */
.form-group select {
    appearance: none;
    background: #fff url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 320 512'><path d='M160 384c17.7 0 32-14.3 32-32s-14.3-32-32-32-32 14.3-32 32 14.3 32 32 32zm0-192c17.7 0 32-14.3 32-32s-14.3-32-32-32-32 14.3-32 32 14.3 32 32 32z'/></svg>") no-repeat right 15px center;
    background-size: 12px;
}

/* 提交按钮样式 */
.button {
    width: 100%;
    padding: 14px;
    background: #3498db;
    color: #fff;
    border: none;
    border-radius: 8px;
    font-size: 1.1rem;
    cursor: pointer;
    transition: background 0.3s;
}

.button:hover {
    background: #2980b9;
}

/* 错误信息样式 */
.error-message {
    color: #e74c3c;
    margin-top: 15px;
    font-size: 0.95rem;
}

/* 响应式适配 */
@media (max-width: 768px) {
    .main-container {
        padding: 20px;
        margin: 20px 3%;
    }
    
    .page-title {
        font-size: 1.8rem;
    }
}
</style>

</head>
<body class="page">

<!-- 保留原始top部分 -->
<div class="top">
    <span class="daohang">
        <span style="color:#ffffff;font-size:40px;">  教师管理系统</span>
        <a href="homePage2.jsp" style="text-decoration:none"><i class="fas fa-user" /></i>教师查询</a>
        <a href="T_course2.jsp" style="text-decoration:none"><i class="fas fa-book-open" /></i>授课查询</a>
        <a href="index.jsp" style="text-decoration:none"><i class="fas fa-user-edit" /></i>管理员:退出</a>
    </span>
</div>

<div class="main-container">
    <a href="T_course2.jsp" class="return-link">
        <i class="fas fa-arrow-left"></i> 返回
    </a>
    
    <h2 class="page-title">修改课程</h2>

    <%
    String name = request.getParameter("course");
    if (name == null || name.isEmpty()) {
        name = (String) session.getAttribute("Cn");
    } else {
        session.setAttribute("Cn", name);
    }
    String time = null;
    String teacher = null;
    int classtime = 0;
    String account = null;
    try {
        List<course> list = CourseDao.getC();
        for (course y : list) {
            if (y.getName().equals(name)) {
                time = y.getTime();
                teacher = y.getTeacher();
                classtime = y.getClassTime();
                account = y.getTaccount();
    %>

    <form action="updatac" method="post">
        <input type="hidden" name="course" value="<%= name %>">
        
        <div class="form-group">
            <label>课程名:</label>
            <div><%= name %></div>
        </div>

        <div class="form-group">
            <label>学期时间:</label>
            <select name="Time" required>
                <option value="<%= time %>">原: <%= time %></option>
                <option value="2025-2026上">2025-2026上</option>
                <option value="2025-2026下">2025-2026下</option>
                <option value="2026-2027上">2026-2027上</option>
                <option value="2026-2027下">2026-2027下</option>
            </select>
        </div>

        <div class="form-group">
            <label>授课教师:</label>
            <select name="account" required>
                <option value="<%= account %>">原: <%= teacher %>（<%= account %>）</option>
                <option value="">请选择教师</option>
                <%
                List<user> us = TeacherDao.getT();
                for (user u : us) {
                %>
                    <option value="<%= u.getAccount() %>"><%= u.getName() %>（<%= u.getAccount() %>）</option>
                <%
                }
                %>
            </select>
        </div>
        <div class="form-group">
            <label>助教教师:</label>
		 <%
		 List<ct> cs = CTDao.getCT();
         for (ct c: cs) {
        	 if(c.getName().equals(name)){
         %>
            <%=c.getTeacher() %>（<%=c.getAccount() %>）
           	<a href="deletect?course=<%=c.getName() %>&account=<%=c.getAccount() %>&where=updataC.jsp" class="return-link">删除</a>
        	<br>
         <%
        	 }
         }
         %>
		</div>
		<a href="CaddT.jsp?course=<%=name %>&account=<%=account %>" class="return-link">新增助教</a>
        <br>
		
		
        <div class="form-group">
            <label>课时:</label>
            <input type="number" name="classtime" value="<%= classtime %>" required>
        </div>

        <button type="submit" class="button">保存修改</button>
        
        <p class="error-message">${requestScope.error}</p>
    </form>

    <%
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
</div>

</body>
</html>