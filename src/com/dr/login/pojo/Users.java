package com.dr.login.pojo;

//实体类的对象
public class Users {


    /**
     *用户的编号
     */
    private  Integer  id;
    /**
     *账号名
     */
    private  String   name;
    /**
     *密码
     */
    private  String pwd;
    //员工的姓名
    private  String userNmame;
    //手机号
    private  String phone;
    //邮件
    private  String emil;
    //标识
    private  String mark;

    @Override
    public String toString() {
        return "Users{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                ", userNmame='" + userNmame + '\'' +
                ", phone='" + phone + '\'' +
                ", emil='" + emil + '\'' +
                ", mark='" + mark + '\'' +
                '}';
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public String getUserNmame() {
        return userNmame;
    }

    public void setUserNmame(String userNmame) {
        this.userNmame = userNmame;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmil() {
        return emil;
    }

    public void setEmil(String emil) {
        this.emil = emil;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {//name
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}
