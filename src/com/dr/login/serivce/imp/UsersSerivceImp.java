package com.dr.login.serivce.imp;

import com.dr.login.dao.IUsersDao;
import com.dr.login.dao.imp.UsesDaoImp;
import com.dr.login.pojo.Users;
import com.dr.login.serivce.IUsersSerivce;
import com.dr.login.utils.MyCodeException;
import com.dr.login.utils.ThisPassWordSHA;

import java.util.List;

import static com.dr.login.utils.MyCodeException.*;

public class UsersSerivceImp implements IUsersSerivce {

     IUsersDao iUsersDao=  new UsesDaoImp();

    //用户登录
    @Override
    public Users loginUsers(String name, String pwd) throws Exception {
        //断言
        isNotNull("用户名不为空",name);
         isNotNull("密码不为空",pwd);
        //将明码进行加密 amdin(名码)。在进行到数据中查询(^<9jl4rpbfau4avln7gf6lk8tms8lr16v5->_)
        String formatSHA = ThisPassWordSHA.getFormatSHA(pwd);


        //调用dao层
        Users   users= iUsersDao.loginUsersDao(name,formatSHA);
        isNotObj("当前用户不存在",users);
          users.setPwd(null);

        return users;
    }

    @Override
    public List<Users> selectUserListSerivce(Users users) throws Exception {

        //断言users
          //不要断言参数
        //调用dao层
        List<Users> usersList=   iUsersDao.selectUserListDao(users);

        return usersList;
    }
}
