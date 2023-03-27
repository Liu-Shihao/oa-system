package com.lsh.service;

import com.lsh.constant.Constants;
import com.lsh.domain.entity.SysTimeline;
import com.lsh.mapper.SysTimelineMapper;
import com.lsh.repository.SysTimelineRepository;
import com.lsh.util.ServletUtils;
import com.lsh.util.StringUtils;
import com.lsh.util.text.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.Predicate;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * @Author: Joey
 * @Date: 2023/3/24 00:02
 * @Desc:
 */
@Service
public class SysTimelineServiceImpl implements ISysTimelineService{
    @Autowired
    SysTimelineRepository sysTimelineRepository;

    @Resource
    SysTimelineMapper sysTimelineMapper;

    //TODO 2023年03月28日01:13:41
    @Override
    public void add(SysTimeline timeline) {
        timeline.setCreateTime(new Date());
        SysTimeline sysTimeline = new SysTimeline();
        int i = sysTimelineMapper.addSysTimeline(timeline);
        sysTimelineRepository.save(sysTimeline);
        sysTimelineRepository.save(timeline);
    }

    @Override
    public void edit(SysTimeline timeline) {

    }

    @Override
    public Page<SysTimeline> selectTimelineList(SysTimeline timeline) {
        Integer pageNo = Convert.toInt(ServletUtils.getParameter(Constants.PAGE_NUM), 1);
        Integer pageSize = Convert.toInt(ServletUtils.getParameter(Constants.PAGE_SIZE), 10);

        Pageable page = PageRequest.of(pageNo - 1, pageSize, Sort.by(Sort.Direction.DESC,"createTime"));
        Page<SysTimeline> timelinePage = sysTimelineRepository.findAll((Specification<SysTimeline>) (root, query, criteriaBuilder) -> {
            ArrayList<Predicate> predicates = new ArrayList<>();
            if (StringUtils.isNotNull(timeline.getTimelineName())){
                Predicate timelineName = criteriaBuilder.equal(root.get("timelineName").as(String.class), "%"+timeline.getTimelineName()+"%");
                predicates.add(timelineName);
            }
            if (StringUtils.isNotNull(timeline.getTimelineContent())){
                Predicate timelineContent = criteriaBuilder.like(root.get("timelineContent").as(String.class), "%"+timeline.getTimelineContent()+"%");
                predicates.add(timelineContent);
            }
            if (StringUtils.isNotNull(timeline.getTimelineComment())){
                Predicate timelineContent = criteriaBuilder.like(root.get("timelineComment").as(String.class), "%"+timeline.getTimelineComment()+"%");
                predicates.add(timelineContent);
            }
            if (StringUtils.isNotNull(timeline.getLeader())){
                Predicate timelineContent = criteriaBuilder.like(root.get("leader").as(String.class), "%"+timeline.getLeader()+"%");
                predicates.add(timelineContent);
            }
            if (StringUtils.isNotNull(timeline.getCreator())){
                Predicate timelineContent = criteriaBuilder.like(root.get("creator").as(String.class), "%"+timeline.getCreator()+"%");
                predicates.add(timelineContent);
            }
            if (StringUtils.isNotNull(timeline.getStatus())){
                Predicate timelineContent = criteriaBuilder.equal(root.get("status").as(String.class), timeline.getStatus());
                predicates.add(timelineContent);
            }
            if (StringUtils.isNotNull(timeline.getParams())){
                String beginTime = Convert.toStr(timeline.getParams().get(Constants.BEGIN_TIME), "");
                String endTime = Convert.toStr(timeline.getParams().get(Constants.END_TIME), "");
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                if (StringUtils.isNotEmpty(beginTime)){
                    try {
                        predicates.add(criteriaBuilder.greaterThanOrEqualTo(root.get("createTime"), simpleDateFormat.parse(beginTime)));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
                if (StringUtils.isNotEmpty(endTime)){
                    try {
                        predicates.add(criteriaBuilder.lessThanOrEqualTo(root.get("createTime"), simpleDateFormat.parse(endTime)));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
            }
            if (StringUtils.isNotNull(timeline.getStatus())){
                Predicate status = criteriaBuilder.equal(root.get("status").as(Integer.class), timeline.getStatus());
                predicates.add(status);
            }

            return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
        }, page);
        return timelinePage;
    }
}
