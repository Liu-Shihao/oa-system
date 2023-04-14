package com.lsh.domain.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 流程表 sys_ processes
 *
 */
@Data
@Entity
@Table(name="sys_processes")
public class SysProcesses {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long processesId;

    /**
     * 流程名称
     */
    private String processesTitle;

    /**
     * 流程描述
     */
    private String processesDescription;

    /**
     * 流程状态
     */
    private String processesStatus;

    /**
     * 流程创建人username
     */
    private String createBy;

    private String delFlag;

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

    /**
     * 流程中包含的步骤
     */
    @Transient
    private List<SysSteps> steps;
}
