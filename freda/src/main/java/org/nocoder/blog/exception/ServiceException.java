package org.nocoder.blog.exception;

/**
 * TODO controller 异常统一处理
 * Service Exception
 * @author jason
 * @date 2018-09-26
 */
public class ServiceException extends Exception {

    private int code;
    private String message;

    private ServiceException(){}

    public ServiceException(int code, String message){
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "ServiceException{" +
                "code=" + code +
                ", message='" + message + '\'' +
                '}';
    }
}
