<%@page import="com.sss.users.user"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8"%>

<%@page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="com.sss.Dao.TeacherDao" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="title" value="新用户注册"/>
<c:set var="webroot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>${title}</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/fontawesome.min.css">
</head>

<body>
	<%
	//HttpSession session = request.getSession();
	String account = request.getParameter("account");
	String password = request.getParameter("password");
	String confirmpass = request.getParameter("confirmpass");
	String code = request.getParameter("code");
	String name = request.getParameter("name");
	String age =request.getParameter("age");
	String sex =request.getParameter("sex");
	String der = request.getParameter("der");
	String ders = request.getParameter("ders");
	String regip = request.getRemoteAddr();
	System.out.println(name+age+sex+account+password+der+ders);
	String mess = validateForm(name,age,der,ders, account, password, confirmpass,code);
	if (!"".equals(mess)){
		request.setAttribute("stuAddMess",mess);
		request.getRequestDispatcher("register.jsp").forward(request,response);
	}else {
		String sessioncode = session.getAttribute("sessioncode").toString();
	if (!code.equals(sessioncode)){
		request.setAttribute("stuAddMess","*验证码错误！");
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}else {
		boolean success = true;
		try {
			List<user> list = TeacherDao.getT();
		
		for(user us : list) {
			
			if(us.getAccount().equals(account)) {
				request.setAttribute("stuAddMess","*该账号已注册！");
				success = false;
				break;
			}			
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (success){
		request.setAttribute("stuAddMess","*注册成功，请登录！");
		request.setAttribute("account", account);
		request.setAttribute("password", password);
		request.setAttribute("confirmpass", confirmpass);
		request.setAttribute("code",code);
		request.setAttribute("name",name);
		request.setAttribute("age",age);
		request.setAttribute("sex",sex);
		request.setAttribute("der",der);
		request.setAttribute("ders",ders);
		
		TeacherDao.addT(name,Integer.valueOf(age), sex, der, ders, account, password);
		request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		else{
			request.setAttribute("stuAddMess","*注册失败！");
			request.getRequestDispatcher("register.jsp").forward(request,response);
		}
		
	}
	
		}%>
	<%!
	String validateForm(String name,String age,String der,String ders, String username,String password,String confirmpass, String code){
	if(name ==null||name.equals("")){
		return "*姓名不能为空！";
	}
	else if(age ==null||age.equals("") ){
		return"*年龄不能为空！";
	}	
	else if(der ==null||der.equals("")){
		return "*职位不能为空！";
	}
	else if(ders ==null||ders.equals("")){
		return"*详情不能为空！";
	}
	else if (username == null || !username.matches("\\w{6,20}")){
		return"*账号不合法！";
	}else if (password == null || !password.matches("\\w{6,20}")){
		return "*密码不合法！";
	}else if (!password.equals(confirmpass)){
		return"*两次输入的密码不一致，请重新输入！";
	}else if (code == null ||!code.matches("\\d{4}")){
		return"*验证码错误！";}
	return"";
	}%>
</body>
</html>