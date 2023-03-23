package com.lsh.repository;

import com.lsh.domain.entity.SysAttendance;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Author: LiuShihao
 * @Date: 2023/3/23 23:58
 * @Desc:
 */
public interface SysAttendanceRepository extends JpaRepository<SysAttendance,Long> {

    SysAttendance findSysAttendanceByCreateByAndAttendanceTypeAndCreateTimeIsStartingWith(String createBy, Integer attendanceType, String createDay);

    SysAttendance findSysAttendanceByAttendanceId (Long id);


}
