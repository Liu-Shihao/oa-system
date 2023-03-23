package com.lsh.service;

import com.lsh.domain.entity.SysTimeline;
import com.lsh.repository.SysTimelineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Joey
 * @Date: 2023/3/24 00:02
 * @Desc:
 */
@Service
public class SysTimelineServiceImpl implements ISysTimelineService{
    @Autowired
    SysTimelineRepository sysTimelineRepository;

    @Override
    public void add(SysTimeline timeline) {

    }

    @Override
    public void edit(SysTimeline timeline) {

    }

    @Override
    public List<SysTimeline> selectTimelineList(SysTimeline timeline) {
        return null;
    }
}
