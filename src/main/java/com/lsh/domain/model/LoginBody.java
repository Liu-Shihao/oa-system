package com.lsh.domain.model;

import lombok.Data;

/**
 * 用户登录对象
 */
@Data
public class LoginBody {
    /**
     * 用户名
     */
    private String username;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 用户手机号码
     */
    private String phoneNumber;

    /**
     * 验证码
     */
    private String code;

    /**
     * 验证码
     */
    private String smsCode;

    /**
     * 唯一标识
     */
    private String uuid;

}
