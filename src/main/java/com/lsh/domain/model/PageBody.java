package com.lsh.domain.model;

import lombok.Data;

import javax.persistence.Transient;

/**
 * @Author: Joey
 * @Date: 2023/3/24 22:34
 * @Desc:
 */
@Data
public class PageBody {
    @Transient
    public int pageNo;
    @Transient
    public int pageSize;
}
