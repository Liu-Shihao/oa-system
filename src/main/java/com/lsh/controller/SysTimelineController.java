package com.lsh.controller;

import com.lsh.domain.AjaxResult;
import com.lsh.domain.entity.SysTimeline;
import com.lsh.service.ISysTimelineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

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
     * 获取列表
     */
    @PreAuthorize("@ss.hasPermi('system:timeline:list')")
    @GetMapping("/list")
    public AjaxResult list(SysTimeline timeline) {
        AjaxResult success = success();
        Page<SysTimeline> timelines = timelineService.selectTimelineList(timeline);
        success.put("rows",timelines.getContent());
        success.put("total",timelines.getTotalElements());
        return success;
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
