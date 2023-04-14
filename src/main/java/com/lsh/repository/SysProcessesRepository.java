package com.lsh.repository;

import com.lsh.domain.entity.SysProcesses;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Author: LiuShihao
 * @Date: 2023/4/14 20:09
 * @Desc:
 */
public interface SysProcessesRepository  extends JpaRepository<SysProcesses,Long>, JpaSpecificationExecutor<SysProcesses> {
}
