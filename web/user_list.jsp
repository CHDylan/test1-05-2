<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/2
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>--%>
<%--导入包是这个--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>员工管理系统</title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="accest/css/style.css">
    <!--[if lt IE 9]>
    <script src="accest/js/html5.js"></script>
    <![endif]-->
    <script src="accest/js/jquery.js"></script>
    <script src="accest/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script>

        (function($){
            $(window).load(function(){

                $("a[rel='load-content']").click(function(e){
                    e.preventDefault();
                    var url=$(this).attr("href");
                    $.get(url,function(data){
                        $(".content .mCSB_container").append(data); //load new content inside .mCSB_container
                        //scroll-to appended content
                        $(".content").mCustomScrollbar("scrollTo","h2:last");
                    });
                });

                $(".content").delegate("a[href='top']","click",function(e){
                    e.preventDefault();
                    $(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
                });

            });
        })(jQuery);
    </script>
</head>
<body>
<!--header-->
<header>
    <h1><img src="accest/images/admin_logo.png"/></h1>
    <ul class="rt_nav">
        <li><a href="login.html" class="quit_icon">安全退出</a></li>
    </ul>
</header>
<!--aside nav-->
<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
    <h2><a href="index.html">admin</a></h2>
    <ul>

        <li>
            <dl>
                <dt>员工管理模块</dt>
                <dd><a href="user_list.html">员工查询</a></dd>
                <dd><a href="user_detail.html">员工添加</a></dd>
                <dd><a href="user_rank.html">员工修改</a></dd>
            </dl>
        </li>
        <li>
            <p class="btm_infor"></p>
        </li>
    </ul>

</aside>

<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">员工列表</h2>
            <a href="user_detail.html" class="fr top_rt_btn add_icon">添加新员工</a>
        </div>
        <section class="mtb">
            <form action="SelectUsersListServlet" method="post">
            姓名
            <input type="text" class="textbox textbox_225" name="userNmame" placeholder="输入员工职位查询..."/>
            手机号
            <input type="text" class="textbox textbox_225" name="phone"  placeholder="输入员工手机号查询..."/>

            <input type="submit" value="查询" class="group_btn"/>
            </form>
        </section>
        <table class="table">
            <tr>
                <th width="23%;">编号</th>
                <th width="15%;">员工账号</th>
                <th width="14%;">手机号码</th>
                <th width="21%;">电子邮件</th>
                <th width="16%;">姓名</th>
                <th>操作</th>
            </tr>
          <%--是一个一集合  ${userlist} 就需要进行遍历   jstl   --%>
       <%--     ${userlist}--%>
            <c:forEach   var="user" items="${userlist}" >
            <tr>
                <td class="center">${user.id}</td>
                <td>${user.name}</td>
                <td class="center">${user.phone}</td>
                <td class="center">${user.emil}</td>
                <td class="center">${user.userNmame}</td>
                <td class="center">
                    <a href="user_detail.html" title="编辑" class="link_icon">&#101;</a>
                    <a href="#" title="删除" class="link_icon">&#100;</a>
                    <a href="user_message.html" title="查询详情" class="link_icon"> &#118;</a>
                </td>
            </tr>
            </c:forEach>
            <%--<tr>
                <td class="center">001</td>
                <td>DeathGhost</td>
                <td class="center">18300000000</td>
                <td class="center">deathghost@sina.cn</td>
                <td class="center">普通员工</td>
                <td class="center">
                    <a href="user_detail.html" title="编辑" class="link_icon">&#101;</a>
                    <a href="#" title="删除" class="link_icon">&#100;</a>
                    <a href="user_message.html" title="查询详情" class="link_icon"> &#118;</a>
                </td>
            </tr>--%>
        </table>
    </div>
</section>
</body>
</html>
