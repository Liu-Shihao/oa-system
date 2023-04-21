package com.lsh.service;

import com.lsh.constant.Constants;
import com.lsh.domain.entity.SysUser;
import com.lsh.domain.entity.SysUserLimit;
import com.lsh.repository.SysAttendanceRepository;
import com.lsh.repository.SysLimitServiceRepository;
import com.lsh.util.ServletUtils;
import com.lsh.util.StringUtils;
import com.lsh.util.text.Convert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @Author: Joey
 * @Date: 2023/4/19 21:05
 * @Desc:
 */
@Service
public class SysLimitServiceImpl implements ISysLimitService{

    @Autowired
    SysLimitServiceRepository sysLimitServiceRepository;

    @Autowired
    SysAttendanceRepository sysAttendanceRepository;



    @Override
    public Page<SysUserLimit> selectUserLimit(SysUserLimit userLimit) {
        Integer pageNo = Convert.toInt(ServletUtils.getParameter(Constants.PAGE_NUM), 1);
        Integer pageSize = Convert.toInt(ServletUtils.getParameter(Constants.PAGE_SIZE), 10);

        Pageable page = PageRequest.of(pageNo - 1, pageSize, Sort.by(Sort.Direction.DESC,"createTime"));
        return sysLimitServiceRepository.findAll(page);
    }

    @Override
    public void add(SysUserLimit userLimit) {
        userLimit.setCreateTime(new Date());
        sysLimitServiceRepository.save(userLimit);
    }

    @Override
    public void update(SysUserLimit userLimit) {
        userLimit.setUpdateTime(new Date());
        sysLimitServiceRepository.save(userLimit);
    }

    @Override
    public void delete(Long[] assetIds) {
        sysLimitServiceRepository.deleteAllById(Arrays.asList(assetIds));
    }

    @Override
    public HashMap<Object, Object> holidayBalance(SysUser user) {
        HashMap<Object, Object> data = new HashMap<>();
        List<SysUserLimit> limits = sysLimitServiceRepository.findSysUserLimitsByUserName(user.getUserName());
        if (StringUtils.isNotEmpty(limits)){
            for (SysUserLimit limit : limits) {
                Integer limitType = limit.getLimitType();
                Integer limitValue = limit.getLimitValue();
                String year = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy"));
                int num = sysAttendanceRepository.findByUserNameAndLeaveTypeAndCreateTimeIsStartingWith(user.getUserName(), limitType, year+"%");
                int balanceDay = limitValue - num;
                String type = limitType == 1 ? "one" : limitType == 2 ? "two":"three";
                data.put(type,balanceDay);
            }
        }else {
            return null;
        }
        return data;
    }
}
