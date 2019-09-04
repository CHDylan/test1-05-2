package com.dr.login.utils;

import com.dr.login.pojo.Users;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//表示需要进行进行拦截的地址
@WebFilter("/*")
public class UrlFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //需要拦截地址
     HttpServletRequest request=(HttpServletRequest)req;
     //获取路径地址
        String requestURI = request.getRequestURI();
        //如当前Seesin中没有数据那么进行跳转到登陆的页面
        Users users = (Users) ((HttpServletRequest) req).getSession().getAttribute("users");

        if(users!=null){
           // req.getRequestDispatcher("login.jsp").forward(req,resp);
            chain.doFilter(req, resp);//放行
        }else if(requestURI.contains("LoginServlet")){
            chain.doFilter(req, resp);//放行
        }else  if (requestURI.contains("login.jsp")){
            chain.doFilter(req, resp);//放行
        }else
        if (requestURI.contains("index.jsp")){
            chain.doFilter(req, resp);//放行
        }else if (requestURI.contains("accest")){
            chain.doFilter(req, resp);//放行
        }else {
               req.getRequestDispatcher("index.jsp").forward(req,resp);
        }




    }

    public void init(FilterConfig config) throws ServletException {

    }

}
