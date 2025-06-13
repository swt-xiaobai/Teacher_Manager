package com.sss.Servlet;

import java.util.ArrayList;

import java.util.List;


import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import com.sss.Dao.CourseDao;
import com.sss.Dao.TeacherDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.sss.users.course;
import com.sss.users.user;

@WebServlet("/addc")
public class addC extends HttpServlet {
private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	response.setContentType("text/html;charset=gbk");
	
	String Cname = request.getParameter("course");
	String time = request.getParameter("Time");
	String Tname="";
	String classTime =request.getParameter("classtime");
	String account = request.getParameter("account");	
	boolean success = true;
	List<course> list = null;
	if(Cname ==null||Cname.equals("")) {
		request.setAttribute("error","*课程名不能为空！");
		request.getRequestDispatcher("addC.jsp").forward(request,response);
	}
	else if(classTime==null||classTime.equals("")) {
		request.setAttribute("error","*课时不能为空！");
		request.getRequestDispatcher("addC.jsp").forward(request,response);
	}
	else {
		Boolean b = true;
		List<user> users = new ArrayList<user>();
		try {
			users = TeacherDao.getT();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(user u : users ) {
			if(account==null|| account.equals(null)||"".equals(account)) {
				
				
				b = false;
			}else if(u.getAccount().equals(account)) {
				Tname = u.getName();
				b = false;
			}
		}
		if(b) {
			request.setAttribute("error","*教师不存在！");
			request.getRequestDispatcher("addC.jsp").forward(request,response);	
		}
		
		else {
	
		
		try {
			list = CourseDao.getC();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(course y : list) {
			if(y.getName().equals(Cname)) {
				System.out.println("修改失败");
				success = false;
				
				break;
				}
			
			}

		if(success) {
			System.out.println("修改.....");
			CourseDao.addC(Cname,time,Tname,classTime,account);
			System.out.println("添加成功");
			request.setAttribute("error","*添加成功！");

		}
		if(!success) {
			System.out.println("添加失败");
			request.setAttribute("error","*课程名重复！");
			request.getRequestDispatcher("addC.jsp").forward(request,response);
		}
		}
}
}
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException{
doGet(request, response);
}
}
