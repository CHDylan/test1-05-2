package com.dr.login.serivce;

import com.dr.login.pojo.Users;

import java.util.List;

public interface IUsersSerivce {
    Users loginUsers(String name, String pwd)throws Exception;

    List<Users> selectUserListSerivce(Users users)throws Exception;
}
