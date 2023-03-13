package com.lsh.service;

import com.lsh.domain.entity.SysUser;
import com.lsh.domain.model.RegisterBody;
import com.lsh.repository.SysUserRepository;
import com.lsh.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: Joey
 * @Date: 2023/3/13 17:40
 * @Desc:
 */
@Service
public class ISysUserServiceImpl implements ISysUserService{

    @Autowired
    SysUserRepository sysUserRepository;


    /**
     * 根据用户名和密码查询用户信息，并生成token令牌返回前端
     * @param username
     * @param password
     * @param code
     * @param uuid
     * @return
     */
    @Override
    public String login(String username, String password, String code, String uuid) {


        return null;
    }

    @Override
    public String register(RegisterBody user) {
        return null;
    }

    @Override
    public SysUser findSysUserByUserName(String username) {
        return sysUserRepository.findSysUserByUserName(username);;
    }
}
