package course.graduation.web.controller;

import course.graduation.model.company;
import course.graduation.model.student;
import course.graduation.model.studentIF;
import course.graduation.model.users;
import course.graduation.service.companyservice;
import course.graduation.service.studentservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;

@Controller
public class ComController {
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

    @RequestMapping(value = "/studentlist" ,method = RequestMethod.GET)
    public String getstudentlist(HttpServletRequest request, HttpSession httpSession){
        company u = (company)request.getSession().getAttribute("user");
        System.out.print(u.getCompanyid());
        List<student> studentList = companyservice.GetStudent(u.getCompanyid());
        httpSession.setAttribute("stulist",studentList);
        return "companySTlist";
    }
    @RequestMapping(value = "/downjianli",method = RequestMethod.GET)
    public void downjianli(@RequestParam("stuid") String stuid,HttpServletRequest request, HttpServletResponse response) throws Exception{

        String fileName = companyservice.backlocation(stuid).getResume();

        //获取输入流
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
        //假如以中文名下载的话
        String[]  strs=fileName.split("/");
        String filename = strs[strs.length-1];
        //转码，免得文件名中文乱码
        filename = URLEncoder.encode(filename,"UTF-8");
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("multipart/form-data");
//        response.reset();
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while((len = bis.read()) != -1){
            out.write(len);
            out.flush();
        }
        out.close();
    }
    @RequestMapping(value = "/liyong",method = RequestMethod.GET)
    public String liyong(@RequestParam("stuid") String stuid,HttpSession httpSession,HttpServletRequest request) throws Exception{
            String comid = studentservice.stuisruzhi(stuid);
            company c = (company) request.getSession().getAttribute("user");
            studentIF studentIF = new studentIF();
            studentIF.setStudentid(stuid);
            studentIF.setCompanyidBystudent(c.getCompanyid());
            if (comid==null||"".equals(comid)){
                companyservice.addrecurit(studentIF);
                httpSession.setAttribute("msg","录用成功");
            }
            else{

                httpSession.setAttribute("msg","该生已被其他公司录用");
            }
            return "success";
    }
    @RequestMapping(value = "/comJudgestu",method = RequestMethod.GET)
    public String comJudgestu(HttpServletRequest request,HttpSession httpSession){
        company com = (company)request.getSession().getAttribute("user");

        List<student> stulist = studentservice.comgetstudent(com.getCompanyid());
        httpSession.setAttribute("stidlist",stulist);
        return "companySTlist2";
    }
    @RequestMapping(value = "/comjudgesan",method = RequestMethod.GET)
    public String comjudgesan(@RequestParam("stuid") String stuid,HttpSession httpSession){
        companyservice.sancomjudge(stuid);
        httpSession.setAttribute("msg","三方协议已经批准通过");
        return "success";
    }
    @RequestMapping(value = "/comjudgesummry",method = RequestMethod.GET)
    public String comjudgesummry(@RequestParam("stuid") String stuid,HttpSession httpSession){
        String msg = companyservice.zjcomjudge(stuid);
        httpSession.setAttribute("msg",msg);
        return "success";
    }
    @RequestMapping(value = "/changerecruit",method = RequestMethod.GET)
    public String changerecruit(@RequestParam("comid") String comid,HttpSession httpSession){
        companyservice.changerecruit(comid);
        httpSession.setAttribute("msg","更改成功");
        return "success";
    }
}
