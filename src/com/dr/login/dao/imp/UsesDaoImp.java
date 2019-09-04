package com.dr.login.dao.imp;

import com.dr.login.dao.IUsersDao;
import com.dr.login.pojo.Users;
import com.dr.login.utils.C3p0Util;
import com.sun.org.apache.xerces.internal.util.EntityResolverWrapper;

import java.util.ArrayList;
import java.util.List;

public class UsesDaoImp implements IUsersDao {
    @Override
    public Users loginUsersDao(String name, String pwd) throws Exception {

        String sql="select * FROM  Users WHERE `name` =? and pwd=?";
        Users users = C3p0Util.queryOne(sql, Users.class, name, pwd);
        return users;
    }

    public static void main(String[] args) throws Exception {
        Users users = new Users();
        users.setUserNmame("小王");
        System.out.println(new UsesDaoImp().selectUserListDao(users));
    }

    @Override
    public List<Users> selectUserListDao(Users users) throws Exception {
        System.out.println("users"+users);
        //Sql
      //  String sql="select * FROM  Users WHERE 1=1 ";
        StringBuffer sql = new StringBuffer("select * FROM  Users WHERE 1=1");
        //写上条件查询的逻辑
        //进行判断查询的条件不为空字符和null值就可进行到数据库中查询
        ArrayList<Object> objects = new ArrayList<>();
        if(users.getUserNmame()!=null && !"".equals(users.getUserNmame())){
            System.out.println("users.getUserNmame()"+users.getUserNmame());
            //注意and 前面加空格
            sql.append(" and userNmame  like ? ");
            //写上条件的值
            objects.add("%"+users.getUserNmame()+"%");
            System.out.println("-----");
        }

        if(users.getPhone()!=null &&  !"".equals(users.getPhone())){

            //注意and 前面加空格
            sql.append("   and phone  = ? ");
            //写上条件的值
            objects.add(users.getPhone());
        }



        System.out.println(sql.toString());
        List<Users> usersList = C3p0Util.queryList(sql.toString(), Users.class,objects.toArray());


        return usersList;
    }
}
