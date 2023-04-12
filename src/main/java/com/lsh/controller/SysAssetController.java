package com.lsh.controller;

import com.lsh.annotation.Anonymous;
import com.lsh.domain.AjaxResult;
import com.lsh.domain.entity.SysAsset;
import com.lsh.domain.entity.SysUser;
import com.lsh.domain.model.LoginUser;
import com.lsh.service.ISysAssetService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

/**
 * @Author: Joey
 * @Date: 2023/4/12 10:33
 * @Desc: 资产管理
 */
@Slf4j
@RestController
@RequestMapping("/system/asset")
public class SysAssetController extends BaseController{

    @Autowired
    private ISysAssetService assetService;


    /**
     * 获取资产列表
     */
    @Anonymous
    @GetMapping("/list")
    public AjaxResult list(SysAsset sysAsset) {
        AjaxResult success = success();
        Page<SysAsset> assetPage = assetService.selectAssetList(sysAsset);
        success.put("rows",assetPage.getContent());
        success.put("total",assetPage.getTotalElements());
        return success;
    }
    @Anonymous
    @PostMapping
    public AjaxResult add(@RequestBody SysAsset sysAsset) {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        sysAsset.setCreateBy(user.getUserName());
        assetService.add(sysAsset);
        return AjaxResult.success("添加成功");
    }
    @Anonymous
    @PutMapping
    public AjaxResult update(@RequestBody SysAsset sysAsset) {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        sysAsset.setUpdateBy(user.getUserName());
        assetService.update(sysAsset);
        return AjaxResult.success("更新成功");
    }
    @Anonymous
    @DeleteMapping ("/{assetIds}")
    public AjaxResult delete(@PathVariable Long[]  assetIds) {
        assetService.delete(assetIds);
        return AjaxResult.success("删除成功");
    }
}
