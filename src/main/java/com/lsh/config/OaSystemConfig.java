package com.lsh.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 读取项目相关配置
 */
@Component
@ConfigurationProperties(prefix = "oasystem")
public class OaSystemConfig {

    /**
     * 上传路径
     */
    private String profile;

    /**
     * 获取地址开关
     */
    private boolean addressEnabled;

    /**
     * 验证码类型
     */
    private String captchaType;

    /**
     * 验证码开关
     */
    private boolean captchaEnabled;

    private int onLine;

    private int offLine;


    public int getOnLine() {
        return onLine;
    }

    public void setOnLine(int onLine) {
        this.onLine = onLine;
    }

    public int getOffLine() {
        return offLine;
    }

    public void setOffLine(int offLine) {
        this.offLine = offLine;
    }

    public boolean isCaptchaEnabled() {
        return captchaEnabled;
    }

    public void setCaptchaEnabled(boolean captchaEnabled) {
        this.captchaEnabled = captchaEnabled;
    }



    public  String getProfile() {
        return profile;
    }


    public  boolean isAddressEnabled() {
        return addressEnabled;
    }


    public  String getCaptchaType() {
        return captchaType;
    }


    /**
     * 获取导入上传路径
     */
    public  String getImportPath() {
        return getProfile() + "/import";
    }

    /**
     * 获取头像上传路径
     */
    public  String getAvatarPath() {
        return getProfile() + "/avatar";
    }

    /**
     * 获取下载路径
     */
    public  String getDownloadPath() {
        return getProfile() + "/download/";
    }

    /**
     * 获取上传路径
     */
    public  String getUploadPath() {
        return getProfile() + "/upload";
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public void setAddressEnabled(boolean addressEnabled) {
        this.addressEnabled = addressEnabled;
    }

    public void setCaptchaType(String captchaType) {
        this.captchaType = captchaType;
    }
}
