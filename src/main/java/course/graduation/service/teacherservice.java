package course.graduation.service;

import course.graduation.model.resume;
import course.graduation.model.stuAndcompany;
import course.graduation.model.studentIF;
import course.graduation.model.teacher;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;


public interface teacherservice {
    teacher getteacherIF(String teacherid);
    void  importExcellnfo(InputStream in, MultipartFile file)throws Exception;
    List<stuAndcompany> teaGetstu(String userid);
    resume backlocation(String studentid);
    List<teacher> GetAllteacher();
    String teachersan(String stuid);
    String teacherzj(String stuid);
    String setrecord(studentIF stIF);
}
