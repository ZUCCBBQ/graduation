package course.graduation.service.imp;

import course.graduation.Encode.ExcelUtil;
import course.graduation.dao.*;
import course.graduation.model.*;
import course.graduation.service.studentservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import javax.annotation.Resource;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Service
public class Studentimp implements studentservice {

    private studentdao studentdao;
    private studentIFdao studentIFdao;
    private STandCOdao sTandCOdao;
    private userdao userdao;
    private resumedao resumedao;
    private sandao sandao;
    @Autowired
    public void setStudentdao(studentdao stdao) {

        this.studentdao = stdao;
    }
    @Autowired
    public void setStudentIFdao(course.graduation.dao.studentIFdao studentIFdao) {
        this.studentIFdao = studentIFdao;
    }
    @Autowired
    public void setUserdao(course.graduation.dao.userdao userdao) {
        this.userdao = userdao;
    }
    @Autowired
    public void setResumedao(course.graduation.dao.resumedao resumedao) {
        this.resumedao = resumedao;
    }
    @Autowired
    public void setsTandCOdao(STandCOdao sTandCOdao) {
        this.sTandCOdao = sTandCOdao;
    }
    @Autowired
    public void setSandao(course.graduation.dao.sandao sandao) {
        this.sandao = sandao;
    }
    public List<san> getallsan(){
        List<san> s = sandao.GetAll();
        return s;
    }
    public List<student> GetAllstudent(){
        List<student> s = studentdao.GetAllstudent();
        return  s;
    }
    public List<student> comgetstudent(String companyid){
        List<student> s = new ArrayList<student>();
        List<String> stuids =studentIFdao.companyGetstudent(companyid);
        for (int i= 0;i<stuids.size();i++){

            s.add(studentdao.Getinformation(stuids.get(i)));
        }
        return s;
    }
    public String stuisruzhi(String studentid){
       String comid = studentIFdao.getstudentIF(studentid);
       return  comid;
    }

    public student getstudentIF(String studentid){
     student studentIF = studentdao.Getinformation(studentid);

        if(studentIF==null){
            System.out.println("查不到该用户");
        }

        return studentIF;

    }
    public String Getteacherid(String studentid){
        String teacherid = studentIFdao.studentGetteacher(studentid);
        return teacherid;
    }
    public void importExcellnfo(InputStream in, MultipartFile file)throws Exception{
        List<List<Object>> listob = ExcelUtil.getBankListByExcel(in,file.getOriginalFilename());
        List<student> studentList = new ArrayList<student>();
        List<users> usersList = new ArrayList<users>();
        //遍历listob数据，把数据放到List中
        for (int i = 0; i < listob.size(); i++) {
            List<Object> ob = listob.get(i);
            student st = new student();
            users u = new users();
            //设置编号
            //通过遍历实现把每一列封装成一个model中，再把所有的model用List集合装载
            st.setStudentid(String.valueOf(ob.get(0)));
            u.setUserid(String.valueOf(ob.get(0)));
            st.setName(String.valueOf(ob.get(1)));
            st.setSex(String.valueOf(ob.get(2)));
            st.setPassword(String.valueOf(ob.get(3)));
            u.setPassword(String.valueOf(ob.get(3)));
            st.setMajorclass(String.valueOf(ob.get(4)));
            u.setRole("学生");
            usersList.add(u);
            studentList.add(st);
        }

        studentdao.insertInfo(studentList);
        userdao.adduser(usersList);
    }
    public void changpwd(String userid,String password){
        studentdao.changepwd(userid,password);
    }
    public void addresume(String userid,String filelocation){
        resume resume = new resume();
        resume.setStudentid(userid);
        resume.setResume(filelocation);
        resume judge =resumedao.isnull(userid);
        if(judge==null) {
            resumedao.inertresume(resume);
        }
        else{
            resumedao.updateresume(resume);
        }
    }

    public boolean addsan(String userid,String filelocation){
        resume resume = new resume();
        resume.setStudentid(userid);
        resume.setSan(filelocation);
        resume judge =resumedao.isnull(userid);
        if(judge==null) {
            resumedao.inertsan(resume);

        }
        else{
            resumedao.updatesan(resume);
        }
        return true;
    }
    public boolean addsummry(String userid,String filelocation){
        resume resume = new resume();
        resume.setStudentid(userid);
        resume.setSummry(filelocation);
        resume judge =resumedao.isnull(userid);
        if(judge==null) {
            resumedao.inertsummry(resume);
        }
        else{
            resumedao.updatesummry(resume);
        }
        return true;
    }

    public boolean addzwjd(String userid,String filelocation){
        resume resume = new resume();
        resume.setStudentid(userid);
        resume.setZwjd(filelocation);
        resume judge =resumedao.isnull(userid);
        if(judge==null) {
            resumedao.inertzwjd(resume);
        }
        else{
            resumedao.updatezwjd(resume);
        }
        return true;
    }
    public boolean STinertCO(STandCO sTandCO){
        List<STandCO> sTandCOList = sTandCOdao.getbystid(sTandCO.getStudentid());
        int i =0 ;
        while (i<sTandCOList.size()){
            if(sTandCOList.get(i).getCompanyid().equals(sTandCO.getCompanyid())){
                return false;
            }
            else{
                i++;
            }
        }
        sTandCOdao.studentinsert(sTandCO);
        return true;
    }
    public boolean insertsan(san san){
        san a = sandao.GetstudentIF(san.getStudentid());
        if(a==null){
            sandao.addIF(san);

        }
        else
        {
            return  false;
        }

        return  true;
    }
}
