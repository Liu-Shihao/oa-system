package com.lsh.repository;

import com.lsh.domain.entity.SysAsset;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Author: LiuShihao
 * @Date: 2023/4/12 10:40
 * @Desc:
 */
public interface SysAssetRepository extends JpaRepository<SysAsset,Long>, JpaSpecificationExecutor<SysAsset> {
}
