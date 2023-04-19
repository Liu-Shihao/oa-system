package com.lsh.repository;

import com.lsh.domain.entity.SysAttendance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * @Author: LiuShihao
 * @Date: 2023/3/23 23:58
 * @Desc:
 */
public interface SysAttendanceRepository extends JpaRepository<SysAttendance,Long>, JpaSpecificationExecutor<SysAttendance> {

    SysAttendance findSysAttendanceByUserNameAndAttendanceTypeAndCreateTimeIsStartingWith(String userName, Integer attendanceType, String createTime);

    SysAttendance findSysAttendanceByAttendanceId (Long id);

    @Query(value = "SELECT count(*) FROM sys_attendance t WHERE t.user_name = :userName AND  t.leave_type =:leaveType AND  t.create_time LIKE :year%",nativeQuery = true)
    int findByUserNameAndLeaveTypeAndCreateTimeIsStartingWith (@Param("userName")String userName,@Param("leaveType")int leaveType,@Param("year")String year);
}
