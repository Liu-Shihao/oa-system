package com.lsh.controller;

import com.lsh.constant.Constants;
import com.lsh.domain.AjaxResult;
import com.lsh.domain.entity.SysMenu;
import com.lsh.domain.entity.SysUser;
import com.lsh.domain.model.LoginBody;
import com.lsh.domain.vo.RouterVo;
import com.lsh.service.ISysMenuService;
import com.lsh.service.SysLoginService;
import com.lsh.service.SysPermissionService;
import com.lsh.util.SecurityUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Set;

import static com.lsh.domain.AjaxResult.success;

/**
 * @Author: Joey
 * @Date: 2023/3/13 17:40
 * @Desc: 用户登录、注册
 */
@Slf4j
@RestController
public class SysLoginController {

    @Autowired
    SysLoginService loginService;

    @Autowired
    private SysPermissionService permissionService;

    @Autowired
    private ISysMenuService menuService;

    /**
     * 登录方法
     *
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody) {
        AjaxResult ajax = success();
        // 生成令牌
        String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(), loginBody.getUuid());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("/getInfo")
    public AjaxResult getInfo() {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 获取路由信息
     *
     * @return 路由信息
     */
    @GetMapping("/getRouters")
    public AjaxResult getRouters() {
        Long userId = SecurityUtils.getUserId();
        log.info("{} 获取路由信息",userId);
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(userId);
        List<RouterVo> routerVos = menuService.buildMenus(menus);
        log.info("返回路由信息{}",routerVos);
        return AjaxResult.success(routerVos);
    }

}
