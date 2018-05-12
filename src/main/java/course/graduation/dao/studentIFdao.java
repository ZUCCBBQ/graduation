package course.graduation.dao;

import course.graduation.model.studentIF;
import course.graduation.model.teacher;

import java.util.List;


public interface studentIFdao {
    String studentGetteacher(String studentid);
    void insertSTrelation(List<studentIF> studentIFList);
    List<studentIF> getstudentsid(String teacherid);
    String getstudentIF(String studentid);
    void   addrecruit(studentIF studentIF);
    studentIF getbystuid(String studentid);
    List<studentIF> getwork();
    List<studentIF> getunwork();
    List<String> companyGetstudent(String companyid);
    void sancompany(String studentid);
    void zjcompany(String studentid);
    void santeacher(String studentid);
    void zjteacher(String studentid);
    List<studentIF> GetAll();
    void setrecord(studentIF studentIF);
}
