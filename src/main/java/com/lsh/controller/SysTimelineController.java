package com.lsh.controller;

import com.lsh.domain.AjaxResult;
import com.lsh.domain.entity.SysTimeline;
import com.lsh.service.ISysTimelineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author: Joey
 * @Date: 2023/3/23 23:59
 * @Desc:
 */
@RestController
@RequestMapping("/system/timeline")
public class SysTimelineController extends BaseController {

    @Autowired
    private ISysTimelineService timelineService;

    /**
     * 获取考勤列表
     */
    @PreAuthorize("@ss.hasPermi('system:timeline:list')")
    @GetMapping("/list")
    public AjaxResult list(@RequestBody SysTimeline timeline) {
        List<SysTimeline> timelines = timelineService.selectTimelineList(timeline);
        return success(timelines);
    }

    /**
     * 创建流程
     * @param timeline
     * @return
     */
    @PreAuthorize("@ss.hasPermi('system:timeline:add')")
    @PostMapping
    public AjaxResult add(@RequestBody SysTimeline timeline) {
        timelineService.add(timeline);
        return success();
    }

    /**
     * 更新流程
     * @param timeline
     * @return
     */
    @PreAuthorize("@ss.hasPermi('system:timeline:edit')")
    @PutMapping
    public AjaxResult edit(@RequestBody SysTimeline timeline) {
        timelineService.edit(timeline);
        return success();
    }
}
