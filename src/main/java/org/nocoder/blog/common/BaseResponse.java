package org.nocoder.blog.common;

public class BaseResponse {
    private int status = 200;
    private Object data;

    public BaseResponse() {
    }

    public BaseResponse(Object data) {
        this.data = data;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
