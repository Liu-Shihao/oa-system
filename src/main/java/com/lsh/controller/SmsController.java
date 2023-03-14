package com.lsh.controller;

import com.lsh.domain.AjaxResult;
import com.lsh.domain.model.LoginBody;
import com.lsh.service.SysLoginService;
import com.lsh.util.sms.SmsUtil;
import com.lsh.util.uuid.IdUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import static com.lsh.domain.AjaxResult.success;

/**
 * @Author: Joey
 * @Date: 2023/3/13 23:53
 * @Desc: 短信服务
 */
@Slf4j
@RestController
public class SmsController {

    @Autowired
    SysLoginService loginService;

    @Autowired
    SmsUtil smsUtil;

    /**
     * 发送短信验证码
     */
    @PostMapping("/sms/send")
    public AjaxResult send(@RequestBody LoginBody loginBody) throws Exception {
        AjaxResult ajax = success();
        //验证图片验证码
        loginService.validateCaptcha(loginBody.getCode(), loginBody.getUuid());
        String uuid = IdUtils.simpleUUID();
        smsUtil.send(loginBody.getPhoneNumber(),uuid);
        ajax.put("uuid", uuid);
        return ajax;
    }
}
