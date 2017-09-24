package org.jasonyang.enumeration;

/**
 * Created by jason on 17/9/3.
 */
public enum AdminPageEnum {
    HOME("home"),
    HOME_CONTENT("home_content"),
    ARCHIVE("archive_management"),
    TAG("tag_management"),
    USER_SETTINGS("user_settings"),
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
