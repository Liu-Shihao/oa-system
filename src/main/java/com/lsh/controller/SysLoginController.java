package com.lsh.controller;

import com.lsh.constant.Constants;
import com.lsh.domain.AjaxResult;
import com.lsh.domain.model.LoginBody;
import com.lsh.service.framework.SysLoginService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import static com.lsh.domain.AjaxResult.success;

/**
 * @Author: Joey
 * @Date: 2023/3/13 17:40
 * @Desc: 用户登录、注册
 */
@Slf4j
@RestController
public class SysLoginController {

    @Autowired
    SysLoginService loginService;

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

}
