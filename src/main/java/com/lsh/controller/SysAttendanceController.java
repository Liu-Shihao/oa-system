package com.lsh.controller;

import com.lsh.annotation.Anonymous;
import com.lsh.domain.AjaxResult;
import com.lsh.domain.entity.SysAttendance;
import com.lsh.domain.entity.SysUser;
import com.lsh.domain.model.LoginUser;
import com.lsh.service.ISysAttendanceService;
import com.lsh.util.DateUtils;
import com.lsh.util.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * @Author: Joey
 * @Date: 2023/3/23 23:59
 * @Desc: 考勤管理
 */
@Slf4j
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
    public AjaxResult list(SysAttendance attendance) {
        AjaxResult success = success();
        Page<SysAttendance> attendances = attendanceService.selectAttendanceList(attendance);
        success.put("rows",attendances.getContent());
        success.put("total",attendances.getTotalElements());
        return success;
    }

    /**
     * 创建考勤记录
     */
//    @PreAuthorize("@ss.hasPermi('system:attendance:add')")
    @PostMapping
    @Anonymous
    public AjaxResult work() {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        attendanceService.work(user.getUserName());
        return success();
    }

    /**
     * 查询当前用户当月的考勤状态
     * @return
     */
    @Anonymous
    @GetMapping("/findUserCurrentMonthAttendanceStatus")
    public AjaxResult findUserCurrentMonthAttendanceStatus() {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        String time = DateUtils.parseDateToStr("yyyy-MM", new Date());
        log.info("查询{} 用户{}月份考勤记录。",user.getUserName(), time);
        List<SysAttendance> attendances = attendanceService.findUserCurrentMonthAttendanceStatus(user.getUserName(),time);
        return success(attendances);
    }

    /**
     * 查询当前用户当月的考勤状态
     * @return
     */
    @Anonymous
    @GetMapping("/findUserCurrentDayAttendanceRecord")
    public AjaxResult findUserCurrentDayAttendanceRecord() {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        String time = DateUtils.parseDateToStr("yyyy-MM-dd", new Date());
        SysAttendance attendances = attendanceService.findUserCurrentDayAttendanceRecord(user.getUserName(),time);
        log.info("{} {} 考勤信息：{}",user.getUserName(),time,attendances);
        return success(StringUtils.isNull(attendances) ? 0 : 1);
    }
}
