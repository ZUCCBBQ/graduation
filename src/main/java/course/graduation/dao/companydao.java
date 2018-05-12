package course.graduation.dao;

import course.graduation.model.company;

import java.util.List;


public interface companydao {
    public company Getinformation(String companyid);
    public List<company> GetALLCompany();
    public List<company> GetALLRightCompany();
    public List<company> GetRecruitCompany();
    void addstudent(String studentid,String companyid);
    void changerightok(String companyid);
    void changerightno(String companyid);
    void addcompany(List<company> com);
    void changerecruitno(String companyid);
    void changerecruitok(String companyid);
}
