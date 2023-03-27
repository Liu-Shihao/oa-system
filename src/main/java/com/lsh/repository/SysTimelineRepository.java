package com.lsh.repository;

import com.lsh.domain.entity.SysTimeline;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

/**
 * @Author: LiuShihao
 * @Date: 2023/3/23 23:57
 * @Desc:
 */
@Repository
public interface SysTimelineRepository extends JpaRepository<SysTimeline,Long>, JpaSpecificationExecutor<SysTimeline> {
}
