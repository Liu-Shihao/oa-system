package com.lsh.enums;

/**
 * @Author: Joey
 * @Date: 2023/3/13 21:54
 * @Desc:
 */
public enum ErrorMsg {

    OK("0", "正常"),
    DISABLE("1", "停用"),
    DELETED("2", "删除");

    private final String errorCode;
    private final String errorMsg;

    ErrorMsg(String errorCode, String errorMsg) {
        this.errorCode = errorCode;
        this.errorMsg = errorMsg;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public String getErrorMsg() {
        return errorMsg;
    }
}
