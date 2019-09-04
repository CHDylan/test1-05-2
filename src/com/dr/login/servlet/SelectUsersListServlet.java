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
import java.util.List;

@WebServlet("/SelectUsersListServlet")
public class SelectUsersListServlet extends HttpServlet {

    IUsersSerivce  iUsersSerivce=   new UsersSerivceImp();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //查询数据

        //有条件查询..
        //获取条件查询的条件值
        /**
         * 查询的条件值,要进封装成对象
         * 要有20个查询
         *    后面快速的封装?
         *    ---------------
         */
        String userNmame = request.getParameter("userNmame");
        String phone = request.getParameter("phone");
        Users users = new Users();//就是为后面的条件查询做出铺垫
       /* users.setName();*/
        users.setUserNmame(userNmame);
        users.setPhone(phone);

        //查询所有
        try {
            List<Users>  userlist = iUsersSerivce.selectUserListSerivce(users);

            System.out.println("userlist:"+userlist);
            //将查询的结果返回给前台页面
            request.setAttribute("userlist",userlist);//重定向request域是无法传达数据
        } catch (Exception e) {
            e.printStackTrace();
        }
        //跳转
        request.getRequestDispatcher("user_list.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);


    }
}
