package course.graduation.dao;

import course.graduation.model.student;

import java.util.List;

public interface studentdao {
     public  List<student> GetAllstudent();
     public student Getinformation(String studentid);
     public void insertInfo(List<student> studentList);
     public void changepwd(String studentid,String password);
}
