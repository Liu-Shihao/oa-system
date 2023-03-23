package com.lsh.repository;

import com.lsh.domain.entity.SysTimeline;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Author: LiuShihao
 * @Date: 2023/3/23 23:57
 * @Desc:
 */
public interface SysTimelineRepository extends JpaRepository<SysTimeline,Long> {
}
