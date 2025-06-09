<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="title" value="新用户(教师)注册"/>
<c:set var="webroot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/fontawesome.min.css">
<title>${title}</title>
</head>
<body class="login">
	<div class="top">
		&nbsp &nbsp <span style="color:#ffffff;font-size:40px;">  教师管理系统</span>
	</div>
	<div class = "center">
	<p style="position: fixed;">
		&nbsp &nbsp<a href="index.jsp">返回</a>
		</p>
	<h1>${title}</h1>
	<div class="operation">填写注册信息↓：<span class="mess" id="stuAddMess">
	<span style="color: blue; ">${requestScope.stuAddMess}</span></span></div>
	<div >
	<form method="post" action="${webroot}/registerDo.jsp">
		<table class="center">
		<tr><td class="label">姓名：</td>
		<td colspan="2"><input type="text" name="name" id="name" value="${requestScope.name}"/></td>
		<td class="label">年龄：</td>
		<td colspan="2"><input type="text" name="age" id="age" value="${requestScope.age}" /></td>
		
		<tr><td class="label">性别：</td>
		<td colspan="2"><select name="sex" >
		 		<option value="男">男</option>
		 		<option value="女">女</option></select> </td>
		<td class="label">职位：</td>
		<td colspan="2"><input type="text" name="der" id="der" value="${requestScope.der}" /></td>		
		<tr><td class="label">详情：</td>
		<td colspan="2"><textarea name="ders" style ="resize:none">${requestScope.ders}</textarea></td> 		
		<tr><td class="label">账号：</td>
		<td colspan="2"><input type="text" name="account" id="account"value="${requestScope.account}"/></td>
		<td class="hint">*账号为英文字母、下划线或数字组合，长度为6-20位</td>
		</tr>
		<tr><td class="label">密码：</td>
		<td colspan="2"><input type="password" name="password" id="password"value="${requestScope.password}"/></td>
		<td class="hint">*密码为英文字母、下划线或数字组合，长度为6-20位</td>
		</tr>
		<tr><td class="label">确认密码：</td>
		<td colspan="2"><input type="password" name="confirmpass" id="confirmpass" value="${requestScope.confirmpass}"/></td>
		<td class="hint">*两次输入的密码要一致</td></tr>
		<tr><td class="label">验证码：</td>
		<td><input style="width: 65px;" type="text" name="code" id="code"value="${requestScope.code}"/></td>
		<td><img src="registerCode.jsp" id="imagecode" title="点击可更换" onclick="this.src+='?tm='+ Math.random();"/></td>
		<td class="hint">*看不清？点击验证码图片可更换</td></tr>
		<tr><td colspan="3">
		<input type="submit" value="注册" class="button" id="submit" style="width:200px"/></td>
		<td colspan="3">
		<input type="reset" value="重置" class="button" id="reset" style="width:200px"/>
		</td></tr>
		</table>
	</form>
	</div></div>
</body>
</html>