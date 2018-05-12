package course.graduation.web.controller;

import course.graduation.Encode.changeYesorNo;
import course.graduation.model.*;
import course.graduation.service.companyservice;
import course.graduation.service.studentservice;
import org.apache.commons.fileupload.FileItem;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.Serializable;
import java.util.List;
@Controller
public class StudentController {
    private companyservice companyservice;
    private studentservice studentservice;

    @Autowired
    public void setCompanyservice(course.graduation.service.companyservice companyservice) {
        this.companyservice = companyservice;
    }
    @Autowired
    public void setStudentservice(course.graduation.service.studentservice studentservice) {
        this.studentservice = studentservice;
    }

    @RequestMapping("/allcompany")
    public String getcompany(HttpSession httpSession){
        List<company> result = companyservice.GetAll();

        httpSession.setAttribute("result",result);
        return "companytable";
    }
    @RequestMapping("/recruitcompany")
    public String getrecruitcompany(HttpSession httpSession){
        List<company> result = companyservice.GetRecruit();
        for(int i=0;i<result.size();i++){
            System.out.print(result.get(i).getAddress());
        }
        httpSession.setAttribute("zhaorenmsg",result);
        return "companytable1";
    }
    @RequestMapping(value = "/upresume",method= RequestMethod.POST)
    public String uploadresume(@RequestParam("upfile") MultipartFile file, HttpServletRequest request, HttpSession httpSession)throws Exception{
        String fileName = file.getOriginalFilename();
        System.out.print(fileName);
        student u = (student)request.getSession().getAttribute("user");

        String filelocation = "/Users/bboymc/Desktop/文件上传/学生简历/"+System.currentTimeMillis()+fileName;
        File dir = new File("",filelocation);
        if(!dir.exists()){
            dir.mkdirs();
        }
        //MultipartFile自带的解析方法
        file.transferTo(dir);
        studentservice.addresume(u.getStudentid(),filelocation);

        return "studentindex";
    }
    @RequestMapping(value = "/upsan",method= RequestMethod.POST)
    public String uploadsan(@RequestParam("upsan") MultipartFile file, HttpServletRequest request, HttpSession httpSession)throws Exception{
        String fileName = file.getOriginalFilename();

        student u = (student)request.getSession().getAttribute("user");

        String filelocation = "/Users/bboymc/Desktop/文件上传/三方协议/"+System.currentTimeMillis()+fileName;
        File dir = new File("",filelocation);
        if(!dir.exists()){
            dir.mkdirs();
        }
        //MultipartFile自带的解析方法
        file.transferTo(dir);
        boolean msg =studentservice.addsan(u.getStudentid(),filelocation);
        httpSession.setAttribute("msg",msg);
        return "studentindex";
    }
    @RequestMapping(value = "/upsummry",method= RequestMethod.POST)
    public String uploadsummry(@RequestParam("upsummry") MultipartFile file, HttpServletRequest request, HttpSession httpSession)throws Exception{
        String fileName = file.getOriginalFilename();

        student u = (student)request.getSession().getAttribute("user");

        String filelocation = "/Users/bboymc/Desktop/文件上传/总结报告/"+System.currentTimeMillis()+fileName;
        File dir = new File("",filelocation);
        if(!dir.exists()){
            dir.mkdirs();
        }
        //MultipartFile自带的解析方法
        file.transferTo(dir);
        boolean msg =studentservice.addsummry(u.getStudentid(),filelocation);
        httpSession.setAttribute("msg",msg);
        return "studentindex";
    }

    @RequestMapping(value = "/upzwjd",method= RequestMethod.POST)
    public String uploadzwjd(@RequestParam("upzwjd") MultipartFile file, HttpServletRequest request, HttpSession httpSession)throws Exception{
        String fileName = file.getOriginalFilename();

        student u = (student)request.getSession().getAttribute("user");

        String filelocation = "/Users/bboymc/Desktop/文件上传/自我鉴定/"+System.currentTimeMillis()+fileName;
        File dir = new File("",filelocation);
        if(!dir.exists()){
            dir.mkdirs();
        }
        //MultipartFile自带的解析方法
        file.transferTo(dir);
        boolean msg =studentservice.addzwjd(u.getStudentid(),filelocation);
        httpSession.setAttribute("msg",msg);
        return "studentindex";
    }

    @RequestMapping(value = "/STinsertCO",method=RequestMethod.GET)
    public String STinsertCO(@RequestParam("comid") String companyid, HttpServletRequest request, HttpSession httpSession){

        student u = (student)request.getSession().getAttribute("user");
        STandCO sTandCO = new STandCO();
//        System.out.print(companyid);
//        System.out.print(u.getStudentid());
        String comid =studentservice.stuisruzhi(u.getStudentid());
        if(comid==null||"".equals(comid)){
            sTandCO.setStudentid(u.getStudentid());
            sTandCO.setCompanyid(companyid);
            Boolean msg =studentservice.STinertCO(sTandCO);
            httpSession.setAttribute("msg",msg);
        }
        else {
            httpSession.setAttribute("msg","您已被其他录用");
        }
        return "success";
    }
    @RequestMapping(value = "/intership",method = RequestMethod.POST)
    public String intership(@RequestParam("studentid") String studentid,
                            @RequestParam("studentname") String studentname,
                            @RequestParam("tel") String phone,
                            @RequestParam("major") String major,@RequestParam("class") String classid,@RequestParam("companyname") String companyname,@RequestParam("place") String companyplace,@RequestParam("position") String position,
                            @RequestParam("type") String type,@RequestParam("begintime") String begintime,@RequestParam("endtime") String endtime){
                changeYesorNo changYesorNo = new changeYesorNo();
                san insan = new san();
                insan.setStudentid(studentid);
                insan.setStudentname(studentname);
                insan.setPhone(phone);
                String majorclass = changYesorNo.changemajor(major)+classid;
                insan.setMajorclass(majorclass);
                insan.setCompanyname(companyname);
                insan.setCompanyplace(companyplace);
                insan.setPosition(position);
                String a = changYesorNo.changetype(type);
                insan.setType(a);
                insan.setBegintime(begintime);
                insan.setEndtime(endtime);
                studentservice.insertsan(insan);
                return "studentindex";

    }
}
