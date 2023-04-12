package com.lsh.service;

import com.lsh.domain.entity.SysAsset;
import org.springframework.data.domain.Page;

/**
 * @Author: Joey
 * @Date: 2023/4/12 10:42
 * @Desc:
 */
public interface ISysAssetService {
    Page<SysAsset> selectAssetList(SysAsset sysAsset);

    void add(SysAsset sysAsset);

    void update(SysAsset sysAsset);

    void delete(Long[] assetIds);
}
