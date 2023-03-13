package com.lsh.domain.model;

import lombok.Data;

/**
 * @Author: Joey
 * @Date: 2023/3/14 00:00
 * @Desc:
 */
@Data
public class SendSmsBody {

    /**
     * 验证码
     */
    private String uuid;
}
