package com.lsh.service;

import com.lsh.domain.entity.SysTimeline;

import java.util.List;

/**
 * @Author: LiuShihao
 * @Date: 2023/3/24 00:01
 * @Desc:
 */
public interface ISysTimelineService {
    void add(SysTimeline timeline);

    void edit(SysTimeline timeline);

    List<SysTimeline> selectTimelineList(SysTimeline timeline);
}
