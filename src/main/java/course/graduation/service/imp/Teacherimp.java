package course.graduation.service.imp;

import course.graduation.Encode.ExcelUtil;
import course.graduation.Encode.changeYesorNo;
import course.graduation.dao.*;
import course.graduation.model.*;
import course.graduation.service.teacherservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Service
public class Teacherimp implements teacherservice {
    private teacherdao teacherdao;
    private studentIFdao studentIFdao;
    private userdao userdao;
    private studentdao studentdao;
    private companydao companydao;
    private resumedao resumedao;
    @Autowired
    public void setTeacherdao(course.graduation.dao.teacherdao teacherdao) {
        this.teacherdao = teacherdao;
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
    public void setStudentdao(course.graduation.dao.studentdao studentdao) {
        this.studentdao = studentdao;
    }
    @Autowired
    public void setCompanydao(course.graduation.dao.companydao companydao) {
        this.companydao = companydao;
    }
    @Autowired
    public void setResumedao(course.graduation.dao.resumedao resumedao) {
        this.resumedao = resumedao;
    }

    public teacher getteacherIF(String teacherid){
        teacher teacherIF = teacherdao.Getinformation(teacherid);
        return teacherIF;

    }
    public void importExcellnfo(InputStream in, MultipartFile file)throws Exception{
        List<List<Object>> listob = ExcelUtil.getBankListByExcel(in,file.getOriginalFilename());
        List<teacher> teacherList = new ArrayList<teacher>();
        List<users> usersList = new ArrayList<users>();
        //遍历listob数据，把数据放到List中
        for (int i = 0; i < listob.size(); i++) {
            List<Object> ob = listob.get(i);
            teacher teacher = new teacher();
            users u = new users();
            //设置编号
            //通过遍历实现把每一列封装成一个model中，再把所有的model用List集合装载
            //teache表
            teacher.setTeacherid(String.valueOf(ob.get(0)));

            teacher.setName(String.valueOf(ob.get(1)));
            teacher.setIntroduce(String.valueOf(ob.get(2)));
            teacher.setOfficeplace(String.valueOf(ob.get(3)));
            teacher.setSex(String.valueOf(ob.get(4)));
            teacher.setEmail(String.valueOf(ob.get(5)));
            teacher.setPhone(String.valueOf(ob.get(6)));
            teacher.setPassword(String.valueOf(ob.get(7)));
            //user表
            u.setUserid(String.valueOf(ob.get(0)));
            u.setPassword(String.valueOf(ob.get(7)));
            u.setRole("老师");
            usersList.add(u);
            teacherList.add(teacher);
        }

        teacherdao.insertInfo(teacherList);
        userdao.adduser(usersList);
    }



    public  List<stuAndcompany> teaGetstu(String userid){
       List <stuAndcompany> stuAndcompanyList = new ArrayList<stuAndcompany>() ;
         List<studentIF> studentIF = studentIFdao.getstudentsid(userid);
         for(int i= 0;i<studentIF.size();i++){
             stuAndcompany stuAndcompany = new stuAndcompany();
             student st = studentdao.Getinformation(studentIF.get(i).getStudentid());
             company com = companydao.Getinformation(studentIF.get(i).getCompanyidBystudent());
             if(com==null){
                 stuAndcompany.setStudentid(st.getStudentid());
                 stuAndcompany.setCompanyname("暂未入职");
                 stuAndcompany.setCompanyplace("暂未入职");
                 stuAndcompany.setMajor(st.getMajorclass());
                 stuAndcompany.setManagername("暂未入职");
                 stuAndcompany.setStudentname(st.getName());
             }
             else{
                 stuAndcompany.setStudentid(st.getStudentid());
                 stuAndcompany.setCompanyname(com.getCompanyname());
                 stuAndcompany.setCompanyplace(com.getAddress());
                 stuAndcompany.setMajor(st.getMajorclass());
                 stuAndcompany.setManagername(com.getManagername());
                 stuAndcompany.setStudentname(st.getName());
             }
             stuAndcompanyList.add(stuAndcompany);
         }
        return stuAndcompanyList;
    }
    public resume backlocation(String studentid){
        resume backlocation =  resumedao.isnull(studentid);
        return backlocation;
    }
   public List<teacher> GetAllteacher(){
        List<teacher> T = teacherdao.GetAllteacher();
        return T;
   }
   public String teachersan(String stuid){
       studentIF a = new studentIF();
       a = studentIFdao.getbystuid(stuid);
        String returnmsg;
       if(a.getSanbycompany().equals("no")){
           returnmsg = "公司尚未填写";
       }
       else {
           studentIFdao.santeacher(stuid);
           returnmsg= "通过成功";
       }
       return returnmsg;
   }
    public String teacherzj(String stuid){
        studentIF a = new studentIF();
        a = studentIFdao.getbystuid(stuid);
        String returnmsg;
        if (a.getSanbycompany().equals("no")||a.getSanbyteacher().equals("no")){
            returnmsg = "该生未通过三方";
        }
       else if (a.getZjbycompany().equals("no")){

            returnmsg="企业尚未通过总结";
        }
        else {
            studentIFdao.zjteacher(stuid);
            returnmsg= "通过成功";
        }
       return returnmsg;

    }
    public String setrecord(studentIF stIF){
        changeYesorNo changeYesorNo = new changeYesorNo();
        studentIF a = new studentIF();
        a = studentIFdao.getbystuid(stIF.getStudentid());
        String returnmsg;
        if (a.getZjbyteacher().equals("no")){
            returnmsg = "该生三方或者总结未通过，不能评分";
        }
        else {
            String record = changeYesorNo.changerecord(stIF.getRecord());
            stIF.setRecord(record);
            studentIFdao.setrecord(stIF);
            returnmsg= "通过成功";
        }
        return returnmsg;

    }

}

