package com.lsh.service;

import com.lsh.domain.entity.SysAttendance;
import com.lsh.exception.ServiceException;
import com.lsh.repository.SysAttendanceRepository;
import com.lsh.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

/**
 * @Author: Joey
 * @Date: 2023/3/24 00:00
 * @Desc:
 */
@Service
public class SysAttendanceServiceImpl implements ISysAttendanceService {



    @Autowired
    SysAttendanceRepository sysAttendanceRepository;

    @Override
    public List<SysAttendance> selectAttendanceList(SysAttendance attendance) {
        return null;
    }

    @Override
    public void add(SysAttendance attendance) {

        SysAttendance attendance1 = sysAttendanceRepository.findSysAttendanceByCreateByAndAttendanceTypeAndCreateTimeIsStartingWith(attendance.getCreateBy(), attendance.getAttendanceType(), LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (StringUtils.isNotNull(attendance1)){
            throw new ServiceException("当日已经存在相同类型考勤！");
        }
        attendance.setCreateTime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:dd")));
        sysAttendanceRepository.save(attendance);
    }

    /**
     * 考勤打卡
     * 如果当天没有同类型的考勤记录，则新建一个考勤记录，并设置
     * @param attendance
     */
    @Override
    public void edit(SysAttendance attendance) {

        SysAttendance sysAttendance = sysAttendanceRepository.findSysAttendanceByCreateByAndAttendanceTypeAndCreateTimeIsStartingWith(attendance.getCreateBy(), attendance.getAttendanceType(), LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        if (StringUtils.isNull(sysAttendance)){
            attendance.setOnLine(attendance.getCurrentDateTime());
            attendance.setCreateTime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:dd")));
            sysAttendanceRepository.save(attendance);
            return;
        }
        sysAttendance.setOffLine(attendance.getCurrentDateTime());
        sysAttendance.setUpdateTime(new Date());
        if (StringUtils.isNotNull(sysAttendance.getOnLine())&& StringUtils.isNotNull(sysAttendance.getOffLine())){
            long nd = 1000 * 24 * 60 * 60;
            long nh = 1000 * 60 * 60;
            long nm = 1000 * 60;
            long diff = sysAttendance.getOffLine().getTime() - sysAttendance.getOnLine().getTime();
            // 计算差多少小时
            long hour = diff % nd / nh;
            // 计算差多少分钟
            long min = diff % nd % nh / nm;
            sysAttendance.setDuration(hour+"小时"+min+"分钟");
        }
        sysAttendanceRepository.save(sysAttendance);
    }
}
