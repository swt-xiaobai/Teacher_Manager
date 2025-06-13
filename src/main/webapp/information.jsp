<%@page import="com.sss.Dao.TeacherDao"%>
<%@page import="com.sss.Dao.CourseDao"%>
<%@page import="com.sss.Dao.CTDao"%>
<%@page import="java.util.List"%>
<%@page import="com.sss.users.user"%>
<%@page import="com.sss.users.ct"%>
<%@page import="com.sss.users.course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>教师详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/fontawesome.min.css">
<style>
.container {
    display: flex;
    justify-content: space-between;
    margin: 20px 5%;
    gap: 30px;
}

.left-section {
    flex: 0 0 60%;
    background: #fff;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.right-section {
    flex: 0 0 38%;
    background: #fff;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.section-title {
    font-size: 28px;
    color: #2c3e50;
    border-bottom: 3px solid #3498db;
    padding-bottom: 10px;
    margin-bottom: 25px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    font-size: 16px;
    color: #555;
    margin-bottom: 5px;
}

.form-group input,
.form-group select,
.form-group textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 15px;
}

.table-container {
    overflow-x: auto;
}

.course-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.course-table th,
.course-table td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #eee;
}

.course-table th {
    background: #f8f9fa;
    font-weight: 600;
    color: #333;
}

.course-table td a {
    color: #e74c3c;
    text-decoration: none;
}

.button {
    display: inline-block;
    padding: 12px 30px;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    transition: background 0.3s;
}

.btn-primary {
    background: #3498db;
    color: #fff;
    margin-right: 10px;
}

.btn-danger {
    background: #e74c3c;
    color: #fff;
}

.btn-primary:hover {
    background: #2980b9;
}

.btn-danger:hover {
    background: #c0392b;
}

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
<%!int allTime = 0; %>
<%
	String account = request.getParameter("account");
    if(account ==null||account.equals(""))
    	account = (String)session.getAttribute("Caccount");
    else session.setAttribute("Caccount", account);
	String name = null;
	int age = 0;
	String sex= null;
	String password= null;
	String der= null;
	String ders= null;
	allTime = 0;
	
	
try{

	List<user> list = TeacherDao.getT();

		for (user y : list ){
				if(account.equals(y.getAccount())){
					name = y.getName();
					age =y.getAge();
					sex = y.getSex();
					password = y.getPassword();
					der = y.getDer();
					ders = y.getDers();
				}			
			}
}
catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>
<div class="top">
    <span class="daohang">
        <span style="color:#ffffff;font-size:40px;">教师管理系统</span>
        <a href="homePage2.jsp" style="text-decoration:none"><i class="fas fa-user"></i> 教师查询</a>
        <a href="T_course2.jsp" style="text-decoration:none"><i class="fas fa-book-open"></i> 授课查询</a>
        <a href="index.jsp" style="text-decoration:none"><i class="fas fa-user-edit"></i> 管理员:退出</a>
    </span>
</div>


<div class="container">
    
    <div class="left-section">
        <h2 class="section-title">教师详情</h2>
        <form action="update" method="post" style="font-size:20px">
            <P style="color:red">${requestScope.error}</P>
            
            <div class="form-group">
                <label>姓名:</label>
                <input type="text" name="name" value="<%=name %>" style="width:100%">
            </div>
            
            <div class="form-group">
                <label>年龄:</label>
                <input type="text" name="age" value="<%=age %>" style="width:100%">
            </div>
            
            <div class="form-group">
                <label>性别:</label>
                <select name="sex" style="width:100%">
                    <option value="<%=sex%>">原：<%=sex%></option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>账号:</label>
                <div><%=account %></div>
            </div>
            
            <div class="form-group">
                <label>密码:</label>
                <div><%=password %></div>
            </div>
            
            <div class="form-group">
                <label>职位:</label>
                <input type="text" name="der" value="<%=der %>" style="width:100%">
            </div>
            
            <div class="form-group">
                <label>详情:</label>
                <textarea name="ders" style="resize:none;vertical-align:bottom;width:100%"><%=ders %></textarea>
            </div>
            
            <button type="submit" class="button btn-primary" style="width:100%">修改</button>
        </form>

        <form action="deletet" method="post" style="margin-top:20px">
            <input type="hidden" name="account" value="<%=account %>"/>
            <button type="submit" class="button btn-danger" style="width:100%">删除教师</button>
        </form>
    </div>

    
    <div class="right-section">
        <h2 class="section-title">授课记录</h2>
        <div class="table-container">
            <table class="course-table">
                <thead>
                    <tr>
                        <th>课程名称</th>
                        <th>开课时间</th>
                        <th>授课教师</th>
                        <th>课时</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    try{
                        List<course> list = CourseDao.getC();
                        for (course y : list ){
                            if(y.getTeacher().equals(name)){
                            	allTime += y.getClassTime();
                    %>
                    <tr>
                        <td><%= y.getName()%></td>
                        <td><%=y.getTime() %></td>
                        <td><%=y.getTeacher() %></td>
                        <td><%=y.getClassTime() %></td>
                        <td>
                            <a href="tdelectc?where=information.jsp&course=<%= y.getName() %>">删除</a>
                        </td>
                    </tr>
                    <% 
                            }
                        }
                    } catch (Exception e) { e.printStackTrace(); }
                    %>
                </tbody>
            </table>
        </div>

        <p style="margin:20px 0">总课时: <%= allTime %></p>
        <form action="" method="get">
		<input type="text" name="koala"placeholder="课时费/课时">
		<input type="submit" name="submit" value="确定">
	</form>

		<%! public class price{
			double k;
			
			price(double k)
			{ this.k = k;}
			double getprice(){
				return k*allTime;
			}
		}
		%>
        <% String m=request.getParameter("koala");
        	double k;

        	if(m!=null && !m.equals("")){
        	k=Double.valueOf(m).doubleValue();
        	}
        	else k=1;
        	price qq = new price(k);
        %>       
        <p>总课时费：<%=qq.getprice() %></p>
        <a href="teacherAddC.jsp?name=<%=name %>&account=<%= account %>" class="add-course-btn">
            <i class="fas fa-plus"></i> 添加课程
        </a>
        <br><br>
        <h2 class="section-title">助教课程</h2>
            <table class="course-table">
                <%

	
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
				
			</tr>
		</thead>
		<tbody>
		<%
			for (ct c : cts ){
				if(c.getTeacher().equals(name)){
					for(course y:list){
						if(c.getName().equals(y.getName())){
				%>
					<tr>
						<td><%= y.getName()%></td>
						<td><%=y.getTime() %></td>
						<td><%=y.getTeacher() %><%=y.getTaccount() %></td>
						<td><%for(ct l :cts ){
							if(l.getName().equals(y.getName()))
								{
									%> 
									<%=l.getTeacher() %> 
									<%if(l.getSex().equals("男")) {
										%><i class="fas fa-male" /></i><%}
										else {%>
										<i class="fas fa-female" /></i>
										<%} %>
										&nbsp
									<%
								}
							
							
						}	%> </td>
						
						<td><%=y.getClassTime() %></td>
						
					</tr>
				<% 
					}
			}
			
		}
	
		
			}
	
	}
	catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	%>
        </table>
    </div>
</div>
</body>
</html>