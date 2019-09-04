<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/1
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>后台登录</title>
  <meta name="author" content="DeathGhost" />
  <link rel="stylesheet" type="text/css" href="accest/css/style.css" />
  <style>
    body{height:100%;background:#16a085;overflow:hidden;}
    canvas{z-index:-1;position:absolute;}
  </style>
  <script src="accest/js/jquery.js"></script>
  <script src="accest/js/verificationNumbers.js"></script>
  <script src="accest/js/Particleground.js"></script>
  <script>
      $(document).ready(function() {
          //粒子背景特效
          $('body').particleground({
              dotColor: '#5cbdaa',
              lineColor: '#5cbdaa'
          });
          //验证码

          //测试提交，对接程序删除即可
         /* $(".submit_btn").click(function(){
              location.href="index.html";
          });*/
      });
  </script>
</head>
<body>
<form action="LoginServlet" method="post">
  <dl class="admin_login">
    <dt>
      <strong>员工后台管理系统</strong>
      <em>Management System</em>
    </dt>
    <dd class="user_icon">
      <input type="text" placeholder="账号" name="usersname" class="login_txtbx"/>
    </dd>
    <dd class="pwd_icon">
      <input type="password" placeholder="密码" name="userspwd"  class="login_txtbx"/>
    </dd>
    <dd>
      <input type="submit" value="立即登录" class="submit_btn" />
    </dd>
    <dd>
      <p>© 2012-2017 </p>
      <p>JAVA B2-10010264-8</p>
    </dd>
  </dl>
</form>
</body>
</html>

