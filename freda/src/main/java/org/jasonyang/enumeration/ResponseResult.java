package org.jasonyang.enumeration;

/**
 * Created by jason on 2017/8/20.
 *
 * @author jason
 */
public enum ResponseResult {
    /**
     * success
     */
    SUCCESS("success"),
    /**
     * failed
     */
    FAILED("failed");

    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    ResponseResult(String status) {
        this.status = status;
    }
}
