package com.dr.login.servlet;

import com.dr.login.pojo.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/OutLoginServlet")
public class OutLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     //删除Seesion域中的信息
        System.out.println("OutLoginServlet");
        request.getSession().removeAttribute("users");
        //进行跳转到登陆的页面
        response.sendRedirect("/login.jsp");
        //获取用户的账号信息
    /*    Users users = (Users) request.getSession().getAttribute("users");
        if (users!=null){

        }*/




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
