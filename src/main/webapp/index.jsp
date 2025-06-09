<%@page import="com.sun.jdi.connect.spi.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>教师管理系统_登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/fontawesome.min.css">
</head>
<body class="login">
<div class="top">
    &nbsp &nbsp <span style="color:#ffffff;font-size:40px;">  教师管理系统</span>
</div>
<div class = "center">
    <p style="font-size:30px;">请登录:</p>
    <form action="login" method="post" >
        您是:<select name="who" style="width:170px">
        <option value="1">教师</option>
        <option value="2">管理员</option>
    </select>
        <br>
        账号:<input type="text" name="account" /><br>
        密码:<input type="password" name="password"/><br>
        <br>
        <input type="submit" value="登录"class="button"id="submit" style="width:200px;height:30px;background-color:#4069ff;color:#ffffff"/>
    </form>
    <P style = "color:red" >${requestScope.why}</P>
    <a href="Login_2.jsp?error=">忘记密码</a>
    <br>
    <a href="register.jsp">创建新用户</a>

</div>

</body>
</html>
