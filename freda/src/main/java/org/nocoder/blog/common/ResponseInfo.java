package org.nocoder.blog.common;

public class ResponseInfo<T> {
    private int status = 200;
    private T data;

    public ResponseInfo() {
    }

    public ResponseInfo(T data) {
        this.data = data;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
