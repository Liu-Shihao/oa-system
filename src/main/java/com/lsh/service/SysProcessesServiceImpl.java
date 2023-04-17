package com.lsh.service;

import com.lsh.constant.Constants;
import com.lsh.domain.entity.SysProcesses;
import com.lsh.domain.entity.SysSteps;
import com.lsh.repository.SysProcessesRepository;
import com.lsh.repository.SysStepsRepository;
import com.lsh.util.ServletUtils;
import com.lsh.util.StringUtils;
import com.lsh.util.text.Convert;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.Predicate;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

/**
 * @Author: Joey
 * @Date: 2023/4/14 20:12
 * @Desc:
 */
@Slf4j
@Service
public class SysProcessesServiceImpl implements ISysProcessesService{

    @Autowired
    SysProcessesRepository sysProcessesRepository;

    @Autowired
    SysStepsRepository sysStepsRepository;

    @Override
    public Page<SysProcesses> selectProcessesList(SysProcesses processes) {
        log.info("查询流程列表：{}",processes);
        Integer pageNo = Convert.toInt(ServletUtils.getParameter(Constants.PAGE_NUM), 1);
        Integer pageSize = Convert.toInt(ServletUtils.getParameter(Constants.PAGE_SIZE), 10);

        Pageable page = PageRequest.of(pageNo - 1, pageSize, Sort.by(Sort.Direction.DESC,"createTime"));
        String username = processes.getCreateBy();
        Page<SysProcesses> sysProcessesPage = sysProcessesRepository.findAll((Specification<SysProcesses>) (root, query, criteriaBuilder) -> {
            ArrayList<Predicate> predicates = new ArrayList<>();
            if (StringUtils.isNotNull(processes.getProcessesTitle())) {
                Predicate processesTitle = criteriaBuilder.like(root.get("processesTitle").as(String.class), "%" + processes.getProcessesTitle() + "%");
                predicates.add(processesTitle);
            }
            if (StringUtils.isNotNull(processes.getParams())) {
                String beginTime = Convert.toStr(processes.getParams().get(Constants.BEGIN_TIME), "");
                String endTime = Convert.toStr(processes.getParams().get(Constants.END_TIME), "");
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                if (StringUtils.isNotEmpty(beginTime)) {
                    try {
                        predicates.add(criteriaBuilder.greaterThanOrEqualTo(root.get("createTime"), simpleDateFormat.parse(beginTime)));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
                if (StringUtils.isNotEmpty(endTime)) {
                    try {
                        predicates.add(criteriaBuilder.lessThanOrEqualTo(root.get("createTime"), simpleDateFormat.parse(endTime)));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
            }
            if (StringUtils.isNotNull(processes.getProcessesDescription())) {
                Predicate processesDescription = criteriaBuilder.like(root.get("processesDescription"), "%" + processes.getProcessesDescription() + "%");
                predicates.add(processesDescription);
            }
            if (StringUtils.isNotNull(processes.getProcessesStatus())) {
                Predicate processesStatus = criteriaBuilder.equal(root.get("processesStatus"), processes.getProcessesStatus());
                predicates.add(processesStatus);
            }
            Predicate user = criteriaBuilder.or( criteriaBuilder.equal(root.get("createBy"), username ),criteriaBuilder.equal(root.get("approverUser"), username));
            predicates.add(user);
            Predicate delFlag = criteriaBuilder.equal(root.get("delFlag"), "0");
            predicates.add(delFlag);
            return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
        }, page);
        for (SysProcesses sysProcesses : sysProcessesPage) {
            List<SysSteps> sysStepsList = sysStepsRepository.findSysStepsByProcessesId(sysProcesses.getProcessesId());
            sysProcesses.setSteps(sysStepsList);
        }
        return sysProcessesPage;
    }

    @Override
    public void add(SysProcesses processes) {
        processes.setCreateTime(new Date());
        processes.setDelFlag("0");
        // 0 进行中  1未开始  2已完成
        processes.setProcessesStatus("1");
        sysProcessesRepository.save(processes);

    }

    @Override
    public void edit(SysProcesses processes) {
        processes.setUpdateTime(new Date());
        sysProcessesRepository.save(processes);
    }

    @Override
    public void delete(Long[] ids) {
        for (Long processesId : ids) {
            Optional<SysProcesses> optional = sysProcessesRepository.findById(processesId);
            if (optional.isPresent()){
                SysProcesses sysProcesses = optional.get();
                sysProcesses.setDelFlag("2");
                sysProcesses.setUpdateTime(new Date());
                sysProcessesRepository.save(sysProcesses);
            }
        }
    }

    @Override
    public void addProcessesSteps(SysSteps steps) {
        steps.setCreateTime(new Date());
        sysStepsRepository.save(steps);
    }

    @Override
    public void editProcessesSteps(SysSteps steps) {
        steps.setUpdateTime(new Date());
        sysStepsRepository.save(steps);
    }
}
