package com.lsh.service;

import com.lsh.constant.Constants;
import com.lsh.domain.entity.SysAsset;
import com.lsh.repository.SysAssetRepository;
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
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Optional;

/**
 * @Author: Joey
 * @Date: 2023/4/12 10:43
 * @Desc:
 */
@Service
@Slf4j
public class SysAssetServiceImpl implements ISysAssetService{

    @Autowired
    private SysAssetRepository sysAssetRepository;

    @Override
    public Page<SysAsset> selectAssetList(SysAsset sysAsset) {
        Integer pageNo = Convert.toInt(ServletUtils.getParameter(Constants.PAGE_NUM), 1);
        Integer pageSize = Convert.toInt(ServletUtils.getParameter(Constants.PAGE_SIZE), 10);

        Pageable page = PageRequest.of(pageNo - 1, pageSize, Sort.by(Sort.Direction.DESC,"createTime"));
        Page<SysAsset> assetPage = sysAssetRepository.findAll((Specification<SysAsset>) (root, query, criteriaBuilder) -> {
            ArrayList<Predicate> predicates = new ArrayList<>();
            if (StringUtils.isNotNull(sysAsset.getAssetName())) {
                Predicate attendanceType = criteriaBuilder.like(root.get("assetName").as(String.class), "%" + sysAsset.getAssetName() + "%");
                predicates.add(attendanceType);
            }
            if (StringUtils.isNotNull(sysAsset.getParams())) {
                String beginTime = Convert.toStr(sysAsset.getParams().get(Constants.BEGIN_TIME), "");
                String endTime = Convert.toStr(sysAsset.getParams().get(Constants.END_TIME), "");
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
            if (StringUtils.isNotNull(sysAsset.getCreateBy())) {
                Predicate status = criteriaBuilder.like(root.get("createBy"), "%" + sysAsset.getCreateBy() + "%");
                predicates.add(status);
            }
            Predicate delFlag = criteriaBuilder.equal(root.get("delFlag"), "0");
            predicates.add(delFlag);
            return criteriaBuilder.and(predicates.toArray(new Predicate[predicates.size()]));
        }, page);
        return assetPage;
    }

    @Override
    public void add(SysAsset sysAsset) {
        sysAsset.setDelFlag("0");
        sysAsset.setCreateTime(new Date());
        double totalValueDouble = Double.valueOf(sysAsset.getAssetValue()) * sysAsset.getNum();
        BigDecimal bigDecimal = BigDecimal.valueOf(totalValueDouble).setScale(2, BigDecimal.ROUND_HALF_EVEN);
        sysAsset.setTotalValue(bigDecimal.toString());
        sysAssetRepository.save(sysAsset);
    }

    @Override
    public void update(SysAsset sysAsset) {
        sysAsset.setUpdateTime(new Date());
        double totalValueDouble = Double.valueOf(sysAsset.getAssetValue()) * sysAsset.getNum();
        BigDecimal bigDecimal = BigDecimal.valueOf(totalValueDouble).setScale(2, BigDecimal.ROUND_HALF_EVEN);
        sysAsset.setTotalValue(bigDecimal.toString());
        sysAssetRepository.save(sysAsset);
    }

    @Override
    public void delete(Long[] assetIds) {
        for (Long assetId : assetIds) {
            Optional<SysAsset> optional = sysAssetRepository.findById(assetId);
            if (optional.isPresent()){
                SysAsset sysAsset = optional.get();
                //删除标志（0代表存在 2代表删除)
                sysAsset.setDelFlag("2");
                sysAsset.setUpdateTime(new Date());
                sysAssetRepository.save(sysAsset);
            }
        }
    }
}
