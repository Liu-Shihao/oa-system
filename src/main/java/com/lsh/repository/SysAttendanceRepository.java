package com.lsh.repository;

import com.lsh.domain.entity.SysAttendance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Author: LiuShihao
 * @Date: 2023/3/23 23:58
 * @Desc:
 */
public interface SysAttendanceRepository extends JpaRepository<SysAttendance,Long>, JpaSpecificationExecutor<SysAttendance> {

    SysAttendance findSysAttendanceByUserNameAndAttendanceTypeAndCreateTimeIsStartingWith(String userName, Integer attendanceType, String createTime);

    SysAttendance findSysAttendanceByAttendanceId (Long id);
}
