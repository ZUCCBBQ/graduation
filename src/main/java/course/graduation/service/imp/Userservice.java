package course.graduation.service.imp;
import course.graduation.dao.userdao;
import course.graduation.model.users;
import course.graduation.service.userservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;


/**
 * Created by bboymc on 2018/4/7.
 */
@Service
public class Userservice implements userservice {

    private userdao userdao;
    @Autowired
    public void setUserdao(userdao userdao) {

        this.userdao = userdao;
    }

    public users login(String userid, String password,String role) {


        users userInfo = userdao.GetUser(userid);

//        System.out.println("userInfo数据库返回值: "+userInfo.getUserid()+","+userInfo.getPassword()+","+userInfo.getRole());
//        System.out.println("user in service: "+user);
        if (userInfo != null) {
            if (userInfo.getPassword().equals(password)&&userInfo.getRole().equals(role)) {
                System.out.println("验证通过");

            }else{
                System.out.println("验证不通过");
                userInfo = null;
            }
        }
        else{
            userInfo = null;
        }
        return userInfo;
    }
    public void updateByexcel(InputStream in, MultipartFile file) throws Exception{

    }
}
