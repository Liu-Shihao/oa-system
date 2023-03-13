package com.lsh.repository;

import com.lsh.domain.entity.SysUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Author: LiuShihao
 * @Date: 2023/3/13 21:22
 * @Desc:
 */
public interface SysUserRepository extends JpaRepository<SysUser,Long>, JpaSpecificationExecutor<SysUser> {

    SysUser findSysUserByUserName (String username);

}
