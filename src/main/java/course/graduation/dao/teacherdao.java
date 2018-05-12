package course.graduation.dao;

import course.graduation.model.teacher;

import java.util.List;

public interface teacherdao {
    public teacher Getinformation(String teacherid);
    public void insertInfo(List<teacher> teacherList);
    public List<teacher> GetAllteacher();
}
