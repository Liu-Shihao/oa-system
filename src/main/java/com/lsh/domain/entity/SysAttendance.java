package com.lsh.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;

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
     * 出勤类型（0正常出勤 1事假 2病假 3缺勤）
     */
    private Integer attendanceType;

    /**
     * 打卡时间
     */
    @Transient
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date currentDateTime;

    /**
     * 上班打卡时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date onLine;

    /**
     * 下班打卡时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date offLine;

    /**
     * 工作时长
     */
    private String duration;

    /**
     * 创建者
     */
    @NotBlank(message = "打工人不能为空")
    private String createBy;

    /**
     * 创建时间
     */
    private String createTime;

    /**
     * 更新者
     */
    private String updateBy;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    public Long getAttendanceId() {
        return attendanceId;
    }

    public void setAttendanceId(Long attendanceId) {
        this.attendanceId = attendanceId;
    }

    public Integer getAttendanceType() {
        return attendanceType;
    }

    public void setAttendanceType(Integer attendanceType) {
        this.attendanceType = attendanceType;
    }

    public Date getOnLine() {
        return onLine;
    }

    public void setOnLine(Date onLine) {
        this.onLine = onLine;
    }

    public Date getOffLine() {
        return offLine;
    }

    public void setOffLine(Date offLine) {
        this.offLine = offLine;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }


    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "SysAttendance{" +
                "attendanceId=" + attendanceId +
                ", attendanceType=" + attendanceType +
                ", onLine=" + onLine +
                ", offLine=" + offLine +
                ", duration='" + duration + '\'' +
                ", createBy='" + createBy + '\'' +
                ", createTime=" + createTime +
                ", updateBy='" + updateBy + '\'' +
                ", updateTime=" + updateTime +
                '}';
    }
}
