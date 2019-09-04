package com.dr.login.dao;

import com.dr.login.pojo.Users;

import java.util.List;

public interface IUsersDao {
    Users loginUsersDao(String name, String pwd)throws  Exception;

    List<Users> selectUserListDao(Users users)throws  Exception;
}
