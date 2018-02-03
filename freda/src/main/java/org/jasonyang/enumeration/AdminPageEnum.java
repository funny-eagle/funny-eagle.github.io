package org.jasonyang.enumeration;

/**
 * @author jason
 */
public enum AdminPageEnum {
    // 首页
    HOME("home"),
    // 首页内容
    HOME_CONTENT("home_content"),
    // 文档管理
    ARCHIVE("archive_management"),
    // 标签管理
    TAG("tag_management"),
    // 用户设置
    USER_SETTINGS("user_settings"),
    // 文档编辑
    EDITOR("editor");

    private String page;

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    AdminPageEnum(String page){
        this.page = page;
    }

//    public static void main(String[] args){
//        String page = "home";
//        for (AdminPageEnum adminPageEnum : AdminPageEnum.values()){
//            if(adminPageEnum.getPage().equals(page)){
//                System.out.println(adminPageEnum.getPage());
//            }
//        }
//    }
}
