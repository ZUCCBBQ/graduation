package course.graduation.service;

import course.graduation.model.STandCO;
import course.graduation.model.san;
import course.graduation.model.student;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;

public interface studentservice {
    student getstudentIF(String studentid);
    String Getteacherid(String studentid);
    void importExcellnfo(InputStream in, MultipartFile file) throws Exception;
    void changpwd(String userid,String password);
    void addresume(String userid,String filelocation);
    boolean addsan(String userid,String filelocation);
    boolean addsummry(String userid,String filelocation);
    boolean addzwjd(String userid,String filelocation);
    boolean STinertCO(STandCO sTandCO);
    List<student> GetAllstudent();
    String stuisruzhi(String studentid);
    List<student> comgetstudent(String companyid);
    boolean insertsan(san san);
    List<san> getallsan();
}

