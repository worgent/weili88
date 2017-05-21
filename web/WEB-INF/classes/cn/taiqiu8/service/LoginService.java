package cn.taiqiu8.service;

/**
 * Created by worgen on 2015/8/3.
 */
public interface LoginService {
    //微信登录
    public int weixinLogin();

    //普通登录
    public int normalLogin();

    //注册普通用户
    public int registerCumstomer();

    //注册助练
    public int registerAssist();

    //是否在线
    public int isOnline();



}
