package course.graduation.service.imp;

import course.graduation.Encode.ExcelUtil;
import course.graduation.dao.*;
import course.graduation.model.*;
import course.graduation.service.companyservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Service
public class Companyimp implements companyservice {
    private companydao companydao;
    private STandCOdao sTandCOdao;
    private studentdao studentdao;
    private resumedao  resumedao;
    private studentIFdao studentIFdao;
    private userdao userdao;

    @Autowired
    public void setCompanydao(companydao companydao) {
        this.companydao = companydao;
    }
    @Autowired
    public void setsTandCOdao(STandCOdao sTandCOdao) {
        this.sTandCOdao = sTandCOdao;
    }
    @Autowired
    public void setStudentdao(course.graduation.dao.studentdao studentdao) {
        this.studentdao = studentdao;
    }
    @Autowired
    public void setResumedao(course.graduation.dao.resumedao resumedao) {
        this.resumedao = resumedao;
    }
    @Autowired
    public void setStudentIFdao(course.graduation.dao.studentIFdao studentIFdao) {
        this.studentIFdao = studentIFdao;
    }
    @Autowired
    public void setUserdao(course.graduation.dao.userdao userdao) {
        this.userdao = userdao;
    }

    public company getcompanyIF(String companyid){
        company companyIF = companydao.Getinformation(companyid);


        return companyIF;

    }
    public List<company> GetAll(){
        List<company> companyList = companydao.GetALLCompany();
        return  companyList;
    }
    public List<company> GetAllRight(){
        List<company> companyList = companydao.GetALLCompany();
        for(int i= 0; i<companyList.size();i++){
            if(companyList.get(i).getRight().equals("no")){
                companyList.get(i).setRight("不准入");
            }
            else {
                companyList.get(i).setRight("准入");
            }
        }
        return  companyList;
    }
    public List<company> GetRecruit(){
        List<company> companyList = companydao.GetRecruitCompany();
        return  companyList;
    }

    public  List<student> GetStudent(String companyid){
        List<STandCO> studentlist = sTandCOdao.getstudentlist(companyid);
        List<student> students = new ArrayList<student>();
        String stuid =null;
        for (int i = 0; i< studentlist.size();i++){
            student st = studentdao.Getinformation(studentlist.get(i).getStudentid());
            students.add(st);
        }
        return students;
    }
    public resume backlocation(String studentid){
        resume backlocation =  resumedao.isnull(studentid);

        return backlocation;
    }
    public void addrecurit(studentIF studentIF){





        studentIFdao.addrecruit(studentIF);
    }
    public void importExcellnfo(InputStream in, MultipartFile file)throws Exception{
        List<List<Object>> listob = ExcelUtil.getBankListByExcel(in,file.getOriginalFilename());
        List<company> companyList = new ArrayList<company>();
        List<users> usersList = new ArrayList<users>();
        //遍历listob数据，把数据放到List中
        for (int i = 0; i < listob.size(); i++) {
            List<Object> ob = listob.get(i);
            company company = new company();
            users u  = new users();
            //设置编号
            //通过遍历实现把每一列封装成一个model中，再把所有的model用List集合装载
            //teache表
            company.setCompanyid(String.valueOf(ob.get(0)));
            company.setCompanyname(String.valueOf(ob.get(1)));
            company.setIntroduce(String.valueOf(ob.get(2)));
            company.setAddress(String.valueOf(ob.get(3)));
            company.setPhone(String.valueOf(ob.get(4)));
            company.setEmail(String.valueOf(ob.get(5)));
            company.setManagername(String.valueOf(ob.get(6)));

            u.setUserid(String.valueOf(ob.get(0)));
            u.setPassword(String.valueOf(ob.get(7)));
            u.setRole("企业");
            companyList.add(company);
            usersList.add(u);
        }
        userdao.adduser(usersList);
        companydao.addcompany(companyList);
    }

    public void sancomjudge(String stuid){
        studentIFdao.sancompany(stuid);
    }
    public String zjcomjudge(String stuid){
        studentIF a = new studentIF();
        a = studentIFdao .getbystuid(stuid);
        String m;
        if(a.getSanbycompany().equals("no")){
            m = "该学生三方未通过";
        }
        else {
            studentIFdao.zjcompany(stuid);
            m = "您通过了该生的总结";
        }
        return m;

    }
    public void changerecruit(String comid){
        company a = companydao.Getinformation(comid);
        if(a.getRecruit().equals("no")){
            companydao.changerecruitok(comid);
        }
        else {
            companydao.changerecruitno(comid);
        }
    }

}
