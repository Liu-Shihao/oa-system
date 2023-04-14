package com.lsh.controller;

import com.lsh.domain.AjaxResult;
import com.lsh.domain.entity.SysProcesses;
import com.lsh.domain.entity.SysSteps;
import com.lsh.domain.entity.SysUser;
import com.lsh.domain.model.LoginUser;
import com.lsh.service.ISysProcessesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * @Author: Joey
 * @Date: 2023/3/23 23:59
 * @Desc:
 */
@RestController
@RequestMapping("/system/processes")
public class SysProcessesController extends BaseController {

    @Autowired
    private ISysProcessesService processesService;

    /**
     * 获取列表
     */
    @PreAuthorize("@ss.hasPermi('system:processes:list')")
    @GetMapping("/list")
    public AjaxResult list(SysProcesses processes) {
        AjaxResult success = success();
        Page<SysProcesses> timelines = processesService.selectProcessesList(processes);
        success.put("rows",timelines.getContent());
        success.put("total",timelines.getTotalElements());
        return success;
    }

    /**
     * 创建流程
     * @param processes
     * @return
     */
    @PreAuthorize("@ss.hasPermi('system:processes:add')")
    @PostMapping
    public AjaxResult add(@RequestBody SysProcesses processes) {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        processes.setCreateBy(user.getUserName());
        processesService.add(processes);
        return success();
    }
    @PreAuthorize("@ss.hasPermi('system:steps:add')")
    @PostMapping("/steps")
    public AjaxResult addProcessesSteps(@RequestBody SysSteps steps) {
        processesService.addProcessesSteps(steps);
        return success();
    }
    @PreAuthorize("@ss.hasPermi('system:steps:edit')")
    @PutMapping("/steps")
    public AjaxResult editProcessesSteps(@RequestBody SysSteps steps) {
        processesService.editProcessesSteps(steps);
        return success();
    }

    /**
     * 更新流程
     * @param processes
     * @return
     */
    @PreAuthorize("@ss.hasPermi('system:processes:edit')")
    @PutMapping
    public AjaxResult edit(@RequestBody SysProcesses processes) {
        processesService.edit(processes);
        return success();
    }

    /**
     * 删除流程
     * @param ids
     * @return
     */
    @PreAuthorize("@ss.hasPermi('system:processes:remove')")
    @DeleteMapping("/{processesId}")
    public AjaxResult delete(@PathVariable("processesId") Long[] ids) {
        processesService.delete(ids);
        return success();
    }
}
