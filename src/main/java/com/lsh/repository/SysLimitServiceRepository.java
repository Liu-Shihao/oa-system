package com.lsh.repository;

import com.lsh.domain.entity.SysUserLimit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * @Author: LiuShihao
 * @Date: 2023/4/19 21:06
 * @Desc:
 */
public interface SysLimitServiceRepository extends JpaRepository<SysUserLimit,Long>, JpaSpecificationExecutor<SysUserLimit> {

    List<SysUserLimit> findSysUserLimitsByUserName (String userName);

    SysUserLimit findSysUserLimitsByUserNameAndLimitType (String userName,int limitType);
}
