package course.graduation.service;

import course.graduation.model.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;

/**
 * Created by bboymc on 2018/5/4.
 */
public interface companyservice {
    company getcompanyIF (String company);
    List<company> GetAll();
    List<company> GetRecruit();
    List<student> GetStudent(String companyid);
    resume backlocation(String studentid);
    void addrecurit(studentIF studentIF);
    void sancomjudge(String stuid);
    String zjcomjudge(String stuid);
    List<company> GetAllRight();
    void  importExcellnfo(InputStream in, MultipartFile file)throws Exception;
    void changerecruit(String comid);

}
