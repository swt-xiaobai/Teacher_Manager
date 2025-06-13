package com.sss.Servlet;


import com.sss.Dao.TeacherDao;
import com.sss.users.user;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@Controller
public class server {

    @RequestMapping("/login")
    public void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=gbk");
        HttpSession session = request.getSession();
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String who = request.getParameter("who");
        boolean success =false;
        if(who.equals("1")) {
            try {

                List<user> list = TeacherDao.getT();

                for(user us : list) {
                    if(us.getAccount().equals(account)) {
                        if(us.getPassword().equals(password)) {
                            session.setAttribute("user", us.getName());
                            session.setAttribute("age", us.getAge());
                            session.setAttribute("sex", us.getSex());
                            session.setAttribute("account", us.getAccount());
                            session.setAttribute("password", us.getPassword());
                            session.setAttribute("der", us.getDer());
                            session.setAttribute("ders", us.getDers());
                            success = true;
                            break;
                        }
                    }
                }
                if(success) {
                    System.out.println("登录成功");
                    response.sendRedirect("homePage.jsp");
                }
                else {
                    System.out.println("account:"+ account);
                    System.out.println("password"+password);
                    System.out.println("登录失败");
                    request.setAttribute("why","登录失败!您输入的账号或密码有误......");
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                    //response.sendRedirect("index.jsp").forward(request,response);
                }


            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }
        else if(who.equals("2")) {
            if("swt111".equals(account) && "112233".equals(password)) {
                response.sendRedirect("homePage2.jsp");

            }
            else {
                request.setAttribute("why","登录失败!您输入的账号或密码有误......");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }

    }


}
}
