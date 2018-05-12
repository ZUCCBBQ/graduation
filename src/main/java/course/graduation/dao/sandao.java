package course.graduation.dao;


import course.graduation.model.san;

import java.util.List;

public interface sandao {
    List<san> GetAll();
    san GetstudentIF(String studentid);
    void addIF(san san);
}
