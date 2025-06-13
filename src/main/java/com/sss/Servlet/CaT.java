package com.sss.Servlet;

import java.util.List;



import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import com.sss.Dao.CourseDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.sss.users.course;
import com.sss.users.user;

@WebServlet("/cat")
public class CaT extends HttpServlet {
private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	response.setContentType("text/html;charset=gbk");
	
	String Cname = request.getParameter("course");
	String Tname = request.getParameter("name");
	String account =request.getParameter("account");
	boolean success = false;
	List<course> list = null;
	
		try {
			list = CourseDao.getC();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(course y : list) {
			if(y.getName().equals(Cname)) {
					
					success = true;
					break;
				}
			}

		if(success) {
			System.out.println("修改.....");
			CourseDao.CaddT(Cname,Tname,account);
			System.out.println("修改成功");
			String name = URLEncoder.encode(Tname,"utf-8") ;
			response.sendRedirect("teacherAddC.jsp?name="+name);
			}
		if(!success) {
		System.out.println("修改失败");
		String name = URLEncoder.encode(Tname,"utf-8") ;
		response.sendRedirect("teacherAddC.jsp?name="+name);
		}
	

}
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException{
doGet(request, response);
}
}
