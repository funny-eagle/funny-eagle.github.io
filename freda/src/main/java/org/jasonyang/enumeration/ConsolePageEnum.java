package org.jasonyang.enumeration;

/**
 * @author jason
 */
public enum ConsolePageEnum {
    // 首页
    INDEX("index"),
    // 文档管理
    ARCHIVE("archive"),
    // 标签管理
    TAG("tag"),
    // 用户设置
    USER_SETTINGS("user-settings"),
    // 文档编辑
    EDIT_ARCHIVE("edit-archive");

    private String page;

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    ConsolePageEnum(String page) {
        this.page = page;
    }

//    public static void main(String[] args){
//        String page = "home";
//        for (ConsolePageEnum adminPageEnum : ConsolePageEnum.values()){
//            if(adminPageEnum.getPage().equals(page)){
//                System.out.println(adminPageEnum.getPage());
//            }
//        }
//    }
}
