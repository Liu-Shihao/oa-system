package com.lsh;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @Author: Joey
 * @Date: 2023/3/13 11:01
 * @Desc:
 */

@Slf4j
@MapperScan("com.lsh.mapper")
@SpringBootApplication
public class AppApplication {
    public static void main(String[] args) {

        SpringApplication.run(AppApplication.class,args);
    }
}
