package com.lsh.controller;

import com.lsh.annotation.Anonymous;
import com.lsh.domain.AjaxResult;
import com.lsh.domain.entity.SysUser;
import com.lsh.domain.entity.SysUserLimit;
import com.lsh.domain.model.LoginUser;
import com.lsh.service.ISysLimitService;
import com.lsh.util.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;


@Slf4j
@RestController
@RequestMapping("/system/limit")
public class SysUserlimitController extends BaseController {

    @Autowired
    private ISysLimitService sysLimitService;

    /**
     * 获取资产列表
     */
    @PreAuthorize("@ss.hasPermi('system:limit:list')")
    @GetMapping("/list")
    public AjaxResult list(SysUserLimit userLimit) {
        AjaxResult success = success();
        Page<SysUserLimit> assetPage = sysLimitService.selectUserLimit(userLimit);
        success.put("rows",assetPage.getContent());
        success.put("total",assetPage.getTotalElements());
        return success;
    }
    @PreAuthorize("@ss.hasPermi('system:limit:add')")
    @PostMapping
    public AjaxResult add(@RequestBody SysUserLimit userLimit) {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        userLimit.setCreateBy(user.getUserName());
        sysLimitService.add(userLimit);
        return AjaxResult.success("添加成功");
    }
    @PreAuthorize("@ss.hasPermi('system:limit:edit')")
    @PutMapping
    public AjaxResult update(@RequestBody SysUserLimit userLimit) {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        userLimit.setUpdateBy(user.getUserName());
        sysLimitService.update(userLimit);
        return AjaxResult.success("更新成功");
    }
    @PreAuthorize("@ss.hasPermi('system:limit:remove')")
    @DeleteMapping ("/{limitIds}")
    public AjaxResult delete(@PathVariable Long[]  limitIds) {
        sysLimitService.delete(limitIds);
        return AjaxResult.success("删除成功");
    }

    /**
     * 查询该员工该年度还有多少假期额度
     * @param
     * @return
     */
    @Anonymous
    @GetMapping ("/holiday/balance")
    public AjaxResult holidayBalance() {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        HashMap<Object,Object> data = sysLimitService.holidayBalance(user);
        log.info("假期余额：{}",data);
        if (StringUtils.isNull(data)) {
            return AjaxResult.error("您当前没有假期！");
        }
        return AjaxResult.success(data);
    }

}
