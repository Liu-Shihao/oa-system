package com.lsh.service;

import com.lsh.config.OaSystemConfig;
import com.lsh.constant.Constants;
import com.lsh.domain.entity.SysAttendance;
import com.lsh.repository.SysAttendanceRepository;
import com.lsh.util.DateUtils;
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
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @Author: Joey
 * @Date: 2023/3/24 00:00
 * @Desc:
 */
@Slf4j
@Service
public class SysAttendanceServiceImpl implements ISysAttendanceService {

    @Autowired
    OaSystemConfig oaSystemConfig;

    @Autowired
    SysAttendanceRepository sysAttendanceRepository;

    @Override
    public Page<SysAttendance> selectAttendanceList(SysAttendance attendance)  {
        Integer pageNo = Convert.toInt(ServletUtils.getParameter(Constants.PAGE_NUM), 1);
        Integer pageSize = Convert.toInt(ServletUtils.getParameter(Constants.PAGE_SIZE), 10);

        Pageable page = PageRequest.of(pageNo - 1, pageSize, Sort.by(Sort.Direction.DESC,"createTime"));
        Page<SysAttendance> attendancePage = sysAttendanceRepository.findAll((Specification<SysAttendance>) (root, query, criteriaBuilder) -> {
            ArrayList<Predicate> predicates = new ArrayList<>();
            if (StringUtils.isNotNull(attendance.getAttendanceType())){
                Predicate attendanceType = criteriaBuilder.equal(root.get("attendanceType").as(Integer.class), attendance.getAttendanceType());
                predicates.add(attendanceType);
            }
            if (StringUtils.isNotEmpty(attendance.getUserName())){
                Predicate createBy = criteriaBuilder.like(root.get("userName").as(String.class), "%"+attendance.getUserName()+"%");
                predicates.add(createBy);
            }
            if (StringUtils.isNotNull(attendance.getParams())){
                String beginTime = Convert.toStr(attendance.getParams().get(Constants.BEGIN_TIME), "");
                String endTime = Convert.toStr(attendance.getParams().get(Constants.END_TIME), "");
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
            if (StringUtils.isNotNull(attendance.getStatus())){
                Predicate status = criteriaBuilder.equal(root.get("status").as(Integer.class), attendance.getStatus());
                predicates.add(status);
            }

            return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
        }, page);
        return attendancePage;
    }

    /**
     * 考勤打卡
     * 如果当天没有同类型的考勤记录，则新建一个考勤记录
     * 如果存在记录，则更新下班打卡时间
     */
    @Override
    public void work(String userName) {
        LocalDateTime now = LocalDateTime.now();
        //查找该用户当天同类型考勤记录
        String time = DateUtils.parseDateToStr("yyyy-MM-dd", new Date());
        SysAttendance sysAttendance = findUserCurrentDayAttendanceRecord(userName, time);

        int onLine = oaSystemConfig.getOnLine();
        //现在打卡时间
        int hour = now.getHour();
        //如果该用户不存在当天改类型考勤记录，则新增一条记录
        if (StringUtils.isNull(sysAttendance)){
            SysAttendance attendance = new SysAttendance();
            attendance.setUserName(userName);
            attendance.setAttendanceType(1);//打卡
            //考勤状态（1正常  2迟到  3早退 4请假 5迟到并早退  0旷工）
            attendance.setStatus(onLine <= hour ? 2 : 1);//如果当前时间大于规定上班时间，则算迟到
            attendance.setOnLine(new Date());
            attendance.setCreateTime(new Date());
            sysAttendanceRepository.save(attendance);
            return;
        }
        int offLine = oaSystemConfig.getOffLine();
        if (hour < offLine){
            //早退
            if (sysAttendance.getStatus() == 2 || sysAttendance.getStatus() == 5){
                //迟到又早退
                sysAttendance.setStatus(5);
            }else {
                //仅早退
                sysAttendance.setStatus(3);
            }
        }
        //如果该用户存在当天改类型考勤记录，则更新改记录下班打卡时间
        sysAttendance.setOffLine(new Date());
        sysAttendance.setUpdateTime(new Date());
        if (StringUtils.isNotNull(sysAttendance.getOnLine())&& StringUtils.isNotNull(sysAttendance.getOffLine())){
            long nd = 1000 * 24 * 60 * 60;
            long nh = 1000 * 60 * 60;
            long nm = 1000 * 60;
            long diff = sysAttendance.getOffLine().getTime() - sysAttendance.getOnLine().getTime();
            // 计算差多少小时
            long hour2 = diff % nd / nh;
            // 计算差多少分钟
            long min = diff % nd % nh / nm;
            sysAttendance.setDuration(hour2+"小时"+min+"分钟");
        }
        sysAttendanceRepository.save(sysAttendance);
    }


    @Override
    public void leave(SysAttendance attendance) throws ParseException {
        String beginTime = Convert.toStr(attendance.getParams().get(Constants.BEGIN_TIME), "");
        String endTime = Convert.toStr(attendance.getParams().get(Constants.END_TIME), "");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date beginDate = simpleDateFormat.parse(beginTime);
        Date endDate = simpleDateFormat.parse(endTime);
        String userName = attendance.getUserName();
        while (!beginDate.after(endDate)){
            attendance.setCreateTime(beginDate);
            attendance.setAttendanceType(2);
            attendance.setStatus(4);
            sysAttendanceRepository.save(attendance);
            attendance = new SysAttendance();
            attendance.setUserName(userName);
            beginDate = addDays(beginDate,1);
        }
    }

    public Date addDays(Date date, int days) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DAY_OF_MONTH, days);
        return cal.getTime();
    }

    @Override
    public List<SysAttendance> findUserCurrentMonthAttendanceStatus(String userName,String currentDate,Boolean isPre) throws Exception {

        return sysAttendanceRepository.findAll((Specification<SysAttendance>) (root, query, criteriaBuilder) -> {
            ArrayList<Predicate> predicates = new ArrayList<>();
            String dateString = formatDateString(currentDate);
            if (isPre){
                try {
                    dateString = getLastMonth(dateString);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            log.info("解析时间：{} ====》{}",currentDate,dateString);
            Predicate predicate1 = criteriaBuilder.equal(root.get("userName").as(String.class), userName);
            predicates.add(predicate1);
            Predicate predicate2 = criteriaBuilder.like(root.get("createTime").as(String.class), dateString+"%");
            predicates.add(predicate2);
            return criteriaBuilder.and(predicates.toArray(new Predicate[2]));
        });
    }

    public String formatDateString(String dateString) {
        SimpleDateFormat inputFormat;
        if (dateString.contains("-")) {
            // 日期字符串中包含"-"，则按照"年-月-日"格式解析
            inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        } else {
            // 否则按照"年 月"格式解析
            inputFormat = new SimpleDateFormat("yyyy 年 MM 月");
        }

        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM");
        try {
            Date date = inputFormat.parse(dateString);
            return outputFormat.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return "";
    }

    public String getLastMonth(String dateStr) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
        Calendar cal = Calendar.getInstance();
        cal.setTime(sdf.parse(dateStr));
        cal.add(Calendar.MONTH, -1);
        return sdf.format(cal.getTime());
    }

    @Override
    public SysAttendance findUserCurrentDayAttendanceRecord(String userName, String time) {
        List<SysAttendance> attendanceList = sysAttendanceRepository.findAll((Specification<SysAttendance>) (root, query, criteriaBuilder) -> {
            ArrayList<Predicate> predicates = new ArrayList<>();

            Predicate predicate1 = criteriaBuilder.equal(root.get("userName").as(String.class), userName);
            predicates.add(predicate1);
            Predicate predicate2 = criteriaBuilder.like(root.get("createTime").as(String.class), DateUtils.parseDateToStr("yyyy-MM-dd", new Date()) + "%");
            predicates.add(predicate2);
            Predicate predicate3 = criteriaBuilder.equal(root.get("attendanceType").as(String.class), "1");
            predicates.add(predicate3);
            return criteriaBuilder.and(predicates.toArray(new Predicate[3]));
        });
        return StringUtils.isNotEmpty(attendanceList)? attendanceList.get(0) : null;
    }

}
