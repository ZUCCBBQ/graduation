package course.graduation.Encode;

import java.io.UnsupportedEncodingException;

/**
 * Created by bboymc on 2018/5/1.
 */
public class trainrole {
    public static String encodeStr(String role) {
        String role1 = null;
        if(role.equals("student")) {
            role1 = "学生";
        }
        else if(role.equals("teacher")){
            role1 ="老师";
        }
        else if (role.equals("company")){
            role1 = "企业";
        }
        else if(role.equals("manager")){
            role1= "管理员";
        }
        else if (role.equals("xgb")){
            role1 ="学工办";
        }
        else {
            role1 = "教学办";
        }
        return role1;
    }

}

