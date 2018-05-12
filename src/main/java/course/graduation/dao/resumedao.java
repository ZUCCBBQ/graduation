package course.graduation.dao;

import course.graduation.model.resume;

/**
 * Created by bboymc on 2018/5/6.
 */
public interface resumedao {
    void inertresume(resume aa);
    void inertsan(resume aa);
    void inertsummry(resume aa);
    void inertzwjd(resume aa);
    resume isnull(String studentid);
    void updateresume(resume aa);
    void updatesan(resume aa);
    void updatesummry(resume aa);
    void updatezwjd(resume aa);
}
