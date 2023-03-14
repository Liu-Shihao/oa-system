package com.lsh.controller;

import com.lsh.domain.AjaxResult;
import com.lsh.domain.model.RegisterBody;
import com.lsh.service.SysRegisterService;
import com.lsh.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import static com.lsh.domain.AjaxResult.error;
import static com.lsh.domain.AjaxResult.success;

/**
 * 注册验证
 */
@RestController
public class SysRegisterController {
    @Autowired
    private SysRegisterService registerService;


    @PostMapping("/register")
    public AjaxResult register(@RequestBody RegisterBody user) {
        String msg = registerService.register(user);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
}
