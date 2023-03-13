package com.lsh.service;

import com.lsh.domain.entity.SysUser;
import com.lsh.domain.model.RegisterBody;

/**
 * @Author: LiuShihao
 * @Date: 2023/3/13 17:40
 * @Desc:
 */
public interface ISysUserService {

    String login(String username, String password, String code, String uuid);

    String register(RegisterBody user);

    SysUser findSysUserByUserName(String username);
}
