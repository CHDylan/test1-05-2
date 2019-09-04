package com.dr.login.servlet;

import com.dr.login.pojo.Users;
import com.dr.login.serivce.IUsersSerivce;
import com.dr.login.serivce.imp.UsersSerivceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用户登录的案例
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
   //Serivce的对象
    IUsersSerivce iUsersSerivce=    new UsersSerivceImp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      //格式化字符集


       //获取数据
       String name= request.getParameter("usersname");
       String pwd= request.getParameter("userspwd");


        //调用Serivce层的
        //如果，当前用户查询的账号和密码在数据中不存在
        try{
            Users users=    iUsersSerivce.loginUsers(name,pwd);
            if(users!=null){
                //当查询的数据ok，然后存入session
                request.getSession().setAttribute("users",users);
            }
            //登陆成功，就进跳转到首页
            response.sendRedirect("/indexs.jsp");
        }catch (Exception ex){
            //如出现了异常那么就进行返回到登陆页面
          // response.sendRedirect("/login.jsp");
            request.getRequestDispatcher("index.jsp").forward(request,response);
            ex.printStackTrace();
        }










    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }
}
