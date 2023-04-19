package com.lsh.domain.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;
import java.util.Map;

/**
 * 考勤表 sys_attendance
 *
 */
@Data
@Entity
@Table(name="sys_attendance")
public class SysAttendance  {
    private static final long serialVersionUID = 1L;

    /**
     * 考勤ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long attendanceId;

    /**
     * 考勤类型（1 打卡 2请假 ）
     */
    private Integer attendanceType;

    /**
     * 考勤状态（1正常  2迟到  3早退 4请假 5迟到并早退  0旷工）
     */
    private Integer status;
    /**
     * 上班打卡时间
     */
    private Date onLine;

    /**
     * 下班打卡时间
     */
    private Date offLine;

    /**
     * 工作时长
     */
    private String duration;

    /**
     * 创建者
     */
    @NotBlank(message = "打工人不能为空")
    private String userName;

    /**
     * 创建时间
     */
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     *限制类型：年假、事假、病假
     */
    private Integer leaveType;

    /**
     * 请假原因
     */
    private String leaveReason;

    /**
     * 请求参数
     */
    @Transient
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private Map<String, Object> params;
}
