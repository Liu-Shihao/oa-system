package com.lsh.service;

import com.lsh.domain.entity.SysTimeline;
import org.springframework.data.domain.Page;

/**
 * @Author: LiuShihao
 * @Date: 2023/3/24 00:01
 * @Desc:
 */
public interface ISysTimelineService {
    Page<SysTimeline> selectTimelineList(SysTimeline timeline);

    void add(SysTimeline timeline);

    void edit(SysTimeline timeline);
}
