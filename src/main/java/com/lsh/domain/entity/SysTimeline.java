package com.lsh.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * 流程管理表 sys_timeline
 *
 */
@Entity
@Table(name="sys_timeline")
public class SysTimeline extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 流程ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long timelineId;

    /**
     * 父流程ID
     */
    private Long parentId;

    /**
     * 流程名称
     */
    private String timelineName;

    /**
     * 流程内容
     */
    private String timelineContent;

    /**
     * 评论
     */
    private Integer timelineComment;

    /**
     * 负责人
     */
    private String leader;

    /**
     * 部门状态:0正常,1停用
     */
    private String status;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;

    /**
     * 创建者
     */
    private String createBy;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * 更新者
     */
    private String updateBy;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    public Long getTimelineId() {
        return timelineId;
    }

    public void setTimelineId(Long timelineId) {
        this.timelineId = timelineId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getTimelineName() {
        return timelineName;
    }

    public void setTimelineName(String timelineName) {
        this.timelineName = timelineName;
    }

    public String getTimelineContent() {
        return timelineContent;
    }

    public void setTimelineContent(String timelineContent) {
        this.timelineContent = timelineContent;
    }

    public Integer getTimelineComment() {
        return timelineComment;
    }

    public void setTimelineComment(Integer timelineComment) {
        this.timelineComment = timelineComment;
    }

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    @Override
    public String getCreateBy() {
        return createBy;
    }

    @Override
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    @Override
    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String getUpdateBy() {
        return updateBy;
    }

    @Override
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    @Override
    public Date getUpdateTime() {
        return updateTime;
    }

    @Override
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "SysTimeline{" +
                "timelineId=" + timelineId +
                ", parentId=" + parentId +
                ", timelineName='" + timelineName + '\'' +
                ", timelineContent='" + timelineContent + '\'' +
                ", timelineComment=" + timelineComment +
                ", leader='" + leader + '\'' +
                ", status='" + status + '\'' +
                ", delFlag='" + delFlag + '\'' +
                ", createBy='" + createBy + '\'' +
                ", createTime=" + createTime +
                ", updateBy='" + updateBy + '\'' +
                ", updateTime=" + updateTime +
                '}';
    }
}
