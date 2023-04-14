package com.lsh.service;

import com.lsh.domain.entity.SysProcesses;
import com.lsh.domain.entity.SysSteps;
import org.springframework.data.domain.Page;

/**
 * @Author: Joey
 * @Date: 2023/4/14 20:12
 * @Desc:
 */
public interface ISysProcessesService {
    Page<SysProcesses> selectProcessesList(SysProcesses processes);

    void add(SysProcesses processes);

    void edit(SysProcesses processes);

    void delete(Long[] ids);

    void addProcessesSteps(SysSteps steps);

    void editProcessesSteps(SysSteps steps);
}
