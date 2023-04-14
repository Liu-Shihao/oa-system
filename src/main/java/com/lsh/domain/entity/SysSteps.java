package com.lsh.domain.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;
import java.util.Map;

/**
 * 流程步骤表 sys_steps
 *
 */
@Data
@Entity
@Table(name="sys_steps")
public class SysSteps {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long stepsId;

    /**
     * 对应的sys_process表ID
     */
    private Long processesId;

    /**
     * 步骤名称
     */
    private String stepsTitle;

    /**
     * 步骤描述
     */
    private String stepsDescription;
    /**
     * 步骤状态
     */
    private String stepsStatus;

    /**
     * 审批人
     */
    private String approverUser;

    /**
     * 创建时间
     */
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;


    /**
     * 更新时间
     */
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateTime;


    /**
     * 请求参数
     */
    @Transient
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private Map<String, Object> params;
}
