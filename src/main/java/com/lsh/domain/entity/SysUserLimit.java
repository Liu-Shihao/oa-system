package com.lsh.domain.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;
import java.util.Map;

@Data
@Entity
@Table(name="sys_user_limit")
public class SysUserLimit  {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long limitId;

    /**
     * 用户名
     */
    private String userName;

    /**
     *限制类型：年假、事假、病假
     */
    private Integer limitType;

    /**
     * 限制天数
     */
    private Integer limitValue;

    /**
     * 创建者
     */
    private String createBy;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新者
     */
    private String updateBy;

    /**
     * 更新时间
     */
    private Date updateTime;


    /**
     * 请求参数
     */
    @Transient
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private Map<String, Object> params;


}
