package com.lsh;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;

/**
 * @Author: Joey
 * @Date: 2023/3/24 22:58
 * @Desc:
 */
@SpringBootTest
public class TimeTest {

    @Test
    public void test(){
        LocalDateTime now = LocalDateTime.now();
        System.out.println(now.getHour());
    }
}
