package com.lsh.service;

import com.lsh.config.OaSystemConfig;
import com.lsh.constant.CacheConstants;
import com.lsh.constant.UserConstants;
import com.lsh.domain.entity.SysUser;
import com.lsh.domain.model.RegisterBody;
import com.lsh.exception.user.CaptchaException;
import com.lsh.exception.user.CaptchaExpireException;
import com.lsh.util.SecurityUtils;
import com.lsh.util.StringUtils;
import com.lsh.util.cache.HazelcastUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 注册校验方法
 *
 */
@Slf4j
@Component
public class SysRegisterService {
    @Autowired
    private ISysUserService userService;

    @Autowired
    OaSystemConfig oaSystemConfig;

    @Autowired
    private HazelcastUtil hazelcastUtil;

    /**
     * 注册
     */
    public String register(RegisterBody registerBody) {
        log.info("注册参数：{}",registerBody);
        String msg = "", username = registerBody.getUsername(), password = registerBody.getPassword();
        SysUser sysUser = new SysUser();
        sysUser.setUserName(username);

        // 校验短信验证码
        validateSmsCode(registerBody.getSmsCode(), registerBody.getUuid());

        if (StringUtils.isEmpty(username)) {
            msg = "用户名不能为空";
        } else if (StringUtils.isEmpty(password)) {
            msg = "用户密码不能为空";
        } else if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            msg = "账户长度必须在2到20个字符之间";
        } else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            msg = "密码长度必须在5到20个字符之间";
        } else if (!userService.checkUserNameUnique(sysUser)) {
            msg = "保存用户'" + username + "'失败，注册账号已存在";
        } else {
            sysUser.setNickName(username);
            sysUser.setPassword(SecurityUtils.encryptPassword(password));
            boolean regFlag = userService.registerUser(sysUser);
            if (!regFlag) {
                msg = "注册失败,请联系系统管理人员";
            } else {
                log.info("{} 注册成功。",username);
            }
        }
        return msg;
    }

    /**
     * 校验验证码
     *
     * @param code     验证码
     * @param uuid     唯一标识
     * @return 结果
     */
    public void validateSmsCode(String code, String uuid) {
        String verifyKey = CacheConstants.SMS_CODE_KEY + StringUtils.nvl(uuid, "");
        String captcha = hazelcastUtil.getCacheObject(verifyKey);

        if (captcha == null) {
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha)) {
            throw new CaptchaException();
        }
        hazelcastUtil.deleteObject(verifyKey);
    }
}
