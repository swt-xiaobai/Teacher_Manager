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

@WebServlet("/deletet")
public class deleteT extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=gbk");

		String account = request.getParameter("account");
		String name = null;
		boolean success = false;
		List<user> list = null;

		try {
			list = TeacherDao.getT();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		for (user us : list) {

			if (us.getAccount().equals(account)) {
				name = us.getName();
				success = true;
				break;
			}
		}

		if (success) {
			System.out.println("修改.....");
			TeacherDao.DeleteT(account,name);
			System.out.println("删除成功");
			response.sendRedirect("homePage2.jsp");
		}
			if (!success) {
				System.out.println("删除失败");
				response.sendRedirect("homePage2.jsp");
			}


		}
		protected void doPost (HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
			doGet(request, response);
		}
	}
