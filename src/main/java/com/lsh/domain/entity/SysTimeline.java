package com.lsh.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * 流程管理表 sys_timeline
 *
 */
@Data
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
    private String parentId;

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
    private String timelineComment;

    /**
     * 负责人
     */
    private String leader;
    /**
     * 创建人
     */
    private String creator;

    /**
     * 部门状态:0正常,1停用
     */
    private Integer status;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private Integer delFlag;

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
}
