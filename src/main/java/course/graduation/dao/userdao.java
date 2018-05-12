package course.graduation.dao;

import java.util.List;

import course.graduation.model.student;
import course.graduation.model.teacher;
import course.graduation.model.users;
/**
 * Created by bboymc on 2018/3/10.
 */
public interface userdao {
    public users GetUser(String userid);
    public void adduser(List<users> u);


}
