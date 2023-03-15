package com.lsh;

import com.lsh.domain.entity.SysUser;
import com.lsh.mapper.SysUserMapper;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @Author: Joey
 * @Date: 2023/3/15 10:54
 * @Desc:
 */
//@ExtendWith(SpringExtension.class)
@SpringBootTest
//@ContextConfiguration(locations = "classpath:mybatis/mybatis-config.xml")
public class MybatisQueryTest {

    @Autowired
    private SysUserMapper userMapper;

    @Test
    public void checkUserNameUniqueTest(){
        SysUser info = userMapper.checkUserNameUnique("test315");
        System.out.println(info);
    }

    @AfterAll
    public static void after(){
        System.out.println("Done.");
    }
}
