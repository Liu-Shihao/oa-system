package com.lsh.controller;

import com.lsh.annotation.Anonymous;
import com.lsh.domain.AjaxResult;
import com.lsh.domain.entity.SysAttendance;
import com.lsh.service.ISysAttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author: Joey
 * @Date: 2023/3/23 23:59
 * @Desc: 考勤管理
 */

@RestController
@RequestMapping("/system/attendance")
public class SysAttendanceController extends BaseController {

    @Autowired
    private ISysAttendanceService attendanceService;


    /**
     * 获取考勤列表
     */
//    @PreAuthorize("@ss.hasPermi('system:attendance:list')")
    @Anonymous
    @GetMapping("/list")
    public AjaxResult list(@RequestBody SysAttendance attendance) {
        List<SysAttendance> attendances = attendanceService.selectAttendanceList(attendance);
        return success(attendances);
    }

    /**
     * 创建考勤记录
     */
//    @PreAuthorize("@ss.hasPermi('system:attendance:add')")
    @PostMapping
    @Anonymous
    public AjaxResult add(@RequestBody SysAttendance attendance) {
        attendanceService.add(attendance);
        return success();
    }

    /**
     * 更新考勤记录
     */
//    @PreAuthorize("@ss.hasPermi('system:attendance:edit')")
    @PutMapping
    @Anonymous
    public AjaxResult edit(@RequestBody SysAttendance attendance) {
        attendanceService.edit(attendance);
        return success();
    }
}
