package course.graduation.web.controller.api;


import course.graduation.Encode.trainrole;
import course.graduation.model.company;
import course.graduation.model.student;
import course.graduation.model.teacher;
import course.graduation.service.companyservice;
import course.graduation.service.studentservice;
import course.graduation.service.teacherservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import course.graduation.model.users;
import course.graduation.service.userservice;

@Controller
@RequestMapping(value = "/api")
public class loginapi {
    private userservice loginService;
    private studentservice studentservice;
    private teacherservice teacherservice;
    private companyservice companyservice;

    @Autowired
    public void setLoginService(userservice loginService) {
        this.loginService = loginService;
    }
    @Autowired
    public void setStudentservice(course.graduation.service.studentservice studentservice) {
        this.studentservice = studentservice;
    }
    @Autowired
    public void setTeacherservice(course.graduation.service.teacherservice teacherservice) {
        this.teacherservice = teacherservice;
    }
    @Autowired
    public void setCompanyservice(course.graduation.service.companyservice companyservice) {
        this.companyservice = companyservice;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)

    public String login(@RequestParam("name_users") String username,
                          @RequestParam("password_users") String password,
                          @RequestParam("role_users") String role,
                          ModelMap modelMap,HttpSession httpSession) {
        if (username == null || password == null ){
            modelMap.put("message","用户名密码不为空");
            return "error";
        }
//        System.out.println("转换之前 "+username+", "+password+","+role);
        role = trainrole.encodeStr(role);
//        System.out.println("user in LoginApi: "+username+", "+password+","+role);
        users userInfo = loginService.login(username,password,role);
        if(userInfo !=null){

            if(userInfo.getRole().equals("学生")){
                student student =  studentservice.getstudentIF(userInfo.getUserid());
                String teacherid = studentservice.Getteacherid(userInfo.getUserid());
                teacher teacher = teacherservice.getteacherIF(teacherid);
                httpSession.setAttribute("user",student);
                httpSession.setAttribute("teacher",teacher);
                return "studentindex";
            }
            else if(userInfo.getRole().equals("老师")){
                teacher teacher = teacherservice.getteacherIF(userInfo.getUserid());
                httpSession.setAttribute("user",teacher);
                return "teacherindex";
            }
            else if(userInfo.getRole().equals("企业")){
                company company = companyservice.getcompanyIF(userInfo.getUserid());
                httpSession.setAttribute("user",company);
                return "companyindex";
            }
            else if(userInfo.getRole().equals("教学办")){
                httpSession.setAttribute("user",userInfo);
                return "jxbindex";
            }
            else if(userInfo.getRole().equals("学工办")){
                httpSession.setAttribute("user",userInfo);
                return "xgbindex";
            }
            else{
                return "error";
            }
        }
        else{
            modelMap.put("message","用户名密码错");
            return "login";
        }
    }
}

