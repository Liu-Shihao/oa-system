package com.lsh.service;

import com.lsh.domain.entity.SysUser;
import com.lsh.domain.entity.SysUserLimit;
import org.springframework.data.domain.Page;

import java.util.HashMap;

/**
 * @Author: LiuShihao
 * @Date: 2023/4/19 21:05
 * @Desc:
 */
public interface ISysLimitService {
    Page<SysUserLimit> selectUserLimit(SysUserLimit userLimit);

    void add(SysUserLimit userLimit);

    void update(SysUserLimit userLimit);

    void delete(Long[] assetIds);

    HashMap<Object, Object> holidayBalance(SysUser user);
}
