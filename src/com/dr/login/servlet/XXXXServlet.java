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
@WebServlet("/XXXXServlet")
public class XXXXServlet extends HttpServlet {
   //Serivce的对象
    IUsersSerivce iUsersSerivce=    new UsersSerivceImp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {










    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }
}
