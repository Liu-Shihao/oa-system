package com.lsh.controller;

import com.lsh.constant.Constants;
import com.lsh.domain.model.LoginBody;
import com.lsh.domain.model.RegisterBody;
import com.lsh.service.LoginService;
import com.lsh.domain.AjaxResult;
import com.lsh.util.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import static com.lsh.domain.AjaxResult.error;
import static com.lsh.domain.AjaxResult.success;

/**
 * @Author: Joey
 * @Date: 2023/3/13 17:40
 * @Desc: 用户登录、注册
 */
@Slf4j
@RestController
public class LoginController {

    @Autowired
    LoginService loginService;

    /**
     * 登录方法
     *
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody) {
        AjaxResult ajax = success();
        // 生成令牌
        String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(), loginBody.getUuid());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     *
     * 用户注册
     *
     * @param user
     * @return
     */
    @PostMapping("/register")
    public AjaxResult register(@RequestBody RegisterBody user) {
        String msg = loginService.register(user);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }


}
