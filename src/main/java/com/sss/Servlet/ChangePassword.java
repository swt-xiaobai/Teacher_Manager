package com.sss.Servlet;

import java.util.List;



import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import com.sss.Dao.TeacherDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.sss.users.user;

@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet {
private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	response.setContentType("text/html;charset=gbk");
	HttpSession session = request.getSession();
	String account = request.getParameter("account");
	String newpassword = request.getParameter("newpassword");
	String oldpassword = request.getParameter("oldpassword");
	boolean success = false;
	List<user> list = null;
	if(newpassword == null || !newpassword.matches("\\w{6,20}") ) {
		System.out.println("密码："+newpassword+"不合法");
		String errMsg = URLEncoder.encode("修改失败！新密码不合法......","utf-8") ;
		response.sendRedirect(request.getParameter("where")+"?error="+errMsg);
	}
	else {
		try {
			list = TeacherDao.getT();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(oldpassword == null ) {
			String name = request.getParameter("name");
			String age = request.getParameter("age");
			for(user us : list) {
	
				if(us.getAccount().equals(account) && us.getName().equals(name)) {
						if(age!=null && Integer.valueOf(age)==us.getAge()) {
							success = true;
							break;
						}
					}
				}
		}
		else {
			for(user us : list) {
	
				if(us.getAccount().equals(account) && us.getPassword().equals(oldpassword)) {
						success = true;
						break;
					}
				}
		}
		if(success) {
			System.out.println("修改.....");
			TeacherDao.ChangePassword(account, newpassword);
			System.out.println("修改成功");
			session.setAttribute("password", newpassword);
			String errMsg = URLEncoder.encode("修改成功！","utf-8") ;
			response.sendRedirect(request.getParameter("where")+"?error="+errMsg);
			}
		if(!success) {
		System.out.println("修改失败");
		String errMsg = URLEncoder.encode("修改失败！您填的信息有误......","utf-8") ;
		response.sendRedirect(request.getParameter("where")+"Login_2.jsp?error="+errMsg);
		}
	}

}
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException{
doGet(request, response);
}
}
