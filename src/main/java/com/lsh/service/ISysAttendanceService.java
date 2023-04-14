package com.lsh.service;

import com.lsh.domain.entity.SysAttendance;
import org.springframework.data.domain.Page;

import java.text.ParseException;
import java.util.List;

/**
 * @Author: LiuShihao
 * @Date: 2023/3/24 00:00
 * @Desc:
 */
public interface ISysAttendanceService {
    Page<SysAttendance> selectAttendanceList(SysAttendance attendance) ;

    void work(String userName);

    List<SysAttendance> findUserCurrentMonthAttendanceStatus(String userName,String currentDate,Boolean isPre) throws Exception;

    SysAttendance findUserCurrentDayAttendanceRecord(String userName, String time);

    void leave(SysAttendance attendance) throws ParseException;
}
