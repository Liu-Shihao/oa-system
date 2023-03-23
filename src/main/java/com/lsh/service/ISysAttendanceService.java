package com.lsh.service;

import com.lsh.domain.entity.SysAttendance;

import java.util.List;

/**
 * @Author: LiuShihao
 * @Date: 2023/3/24 00:00
 * @Desc:
 */
public interface ISysAttendanceService {
    List<SysAttendance> selectAttendanceList(SysAttendance attendance);

    void add(SysAttendance attendance);

    void edit(SysAttendance attendance);
}
