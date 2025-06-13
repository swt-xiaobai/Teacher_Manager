package com.sss.Servlet;

import java.util.List;



import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.sss.users.user;
import com.sss.Dao.TeacherDao;

@WebServlet("/update")
public class UpDate extends HttpServlet {
private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	response.setContentType("text/html;charset=gbk");
	
	HttpSession session = request.getSession(); 
	String account = (String) session.getAttribute("Caccount");
	System.out.println(account);
	String password = null;
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String sex = request.getParameter("sex");
	String der = request.getParameter("der");
	String ders = request.getParameter("ders");
	boolean success = false;
	List<user> list = null;
	
		try {
			list = TeacherDao.getT();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(user us : list) {
			if(us.getAccount().equals(account)) {
					password = us.getPassword();
					success = true;
					break;
				}
			}

		if(success) {
			System.out.println("修改.....");
			TeacherDao.updateT(name,Integer.valueOf(age) ,sex,der,ders,account,password);
			System.out.println("修改成功");
			request.setAttribute("error","*修改成功！");
			request.getRequestDispatcher("information.jsp").forward(request,response);
			}
		if(!success) {
		System.out.println("修改失败");
		request.setAttribute("error","*修改失败！");
		request.getRequestDispatcher("information.jsp").forward(request,response);
		}
	

}
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException{
doGet(request, response);
}
}
