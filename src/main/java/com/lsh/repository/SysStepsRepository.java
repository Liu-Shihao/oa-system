package com.lsh.repository;

import com.lsh.domain.entity.SysSteps;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * @Author: LiuShihao
 * @Date: 2023/4/14 20:09
 * @Desc:
 */
public interface SysStepsRepository extends JpaRepository<SysSteps,Long>, JpaSpecificationExecutor<SysSteps> {

    List<SysSteps> findSysStepsByProcessesId (Long processesId);

}
