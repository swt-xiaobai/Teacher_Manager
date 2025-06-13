package com.sss.Servlet;

import java.util.List;


import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import com.sss.Dao.CTDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.sss.users.course;
import com.sss.users.ct;
import com.sss.users.user;

@WebServlet("/deletect")
public class deleteCt extends HttpServlet {
private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	response.setContentType("text/html;charset=gbk");
	
	String name = request.getParameter("course");
	String account =request.getParameter("account");
	String where = request.getParameter("where");

	boolean success = false;
	List<ct> list = null;
	
		try {
			list = CTDao.getCT();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(ct c: list) {
			if(c.getName().equals(name)) {
				if(c.getAccount().equals(account)) {	
					success = true;
					break;
				}
				}
			}

		if(success) {
			System.out.println("修改.....");
			CTDao.deleteCT(name,account);
			System.out.println("修改成功");
			response.sendRedirect(where);
			}
		if(!success) {
			System.out.println("修改失败");
			request.setAttribute("error","*修改失败！");
			response.sendRedirect(where);
		}
	

}
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException{
doGet(request, response);
}
}
