package course.graduation.service;

import course.graduation.model.users;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;
 /* Created by bboymc on 2018/3/10.import java.util.List;*/

public interface userservice {
    users login(String username,String password,String role);
    void updateByexcel(InputStream in, MultipartFile file) throws Exception;
}
