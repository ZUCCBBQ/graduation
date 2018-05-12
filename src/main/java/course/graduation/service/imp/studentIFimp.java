package course.graduation.service.imp;

import course.graduation.dao.studentIFdao;
import course.graduation.model.studentIF;
import course.graduation.service.studentIFservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class studentIFimp implements studentIFservice {
    private studentIFdao studentIFdao;
    @Autowired
    public void setStudentIFdao(course.graduation.dao.studentIFdao studentIFdao) {
        this.studentIFdao = studentIFdao;
    }

//    List<studentIF> teachergetstudent(String userid){
//
//    }
}
