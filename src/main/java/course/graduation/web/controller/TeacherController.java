package course.graduation.web.controller;

import course.graduation.model.stuAndcompany;
import course.graduation.model.studentIF;
import course.graduation.model.teacher;
import course.graduation.service.teacherservice;
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
public class TeacherController {
    private teacherservice teacherservice;
    @Autowired
    public void setTeacherservice(course.graduation.service.teacherservice teacherservice) {
        this.teacherservice = teacherservice;
    }
    @RequestMapping("/getstudentInfo")
    public String getstudentInfo(HttpServletRequest request,HttpSession httpSession){
        teacher T = (teacher)request.getSession().getAttribute("user");
        List<stuAndcompany> stulist = teacherservice.teaGetstu(T.getTeacherid());
        httpSession.setAttribute("teagetstu",stulist);
        return "teacherSTU";
    }
    @RequestMapping("/getstuid")
    public String getstuid(HttpServletRequest request,HttpSession httpSession){
        teacher T = (teacher)request.getSession().getAttribute("user");
        List<stuAndcompany> stulist = teacherservice.teaGetstu(T.getTeacherid());
        httpSession.setAttribute("stidlist",stulist);
        return "teacherDownload";
    }
    @RequestMapping(value = "/downsan",method = RequestMethod.GET)
    public String downsan(@RequestParam("stuid") String stuid,HttpSession session, HttpServletResponse response) throws Exception{

        String fileName = teacherservice.backlocation(stuid).getSan();

        if(fileName==null||"".equals(fileName)){
            session.setAttribute("msg","该生没有上传");
            return "success";
        }

        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
        //假如以中文名下载的话
        String[]  strs=fileName.split("/");
        String filename = strs[strs.length-1];
        //转码，免得文件名中文乱码
        filename = URLEncoder.encode(filename,"UTF-8");
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" +filename);
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

        return "success";
}
    @RequestMapping(value = "/downsummry",method = RequestMethod.GET)
    public String downsummry(@RequestParam("stuid") String stuid,HttpSession session, HttpServletResponse response) throws Exception{
        String fileName = teacherservice.backlocation(stuid).getSummry();

        if(fileName==null||"".equals(fileName)){
            session.setAttribute("msg","该生没有上传总结");
            return "success";
        }

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

        return "success";
    }
    @RequestMapping(value = "/downzwjd",method = RequestMethod.GET)
    public String downzwjd(@RequestParam("stuid") String stuid,HttpSession session, HttpServletResponse response) throws Exception{
        String fileName = teacherservice.backlocation(stuid).getZwjd();


        if(fileName==null||"".equals(fileName)){
            session.setAttribute("msg","该生没有上传自我鉴定");
            return "success";
        }
        String[]  strs=fileName.split("/");
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
        //假如以中文名下载的话
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

        return "success";
    }
    @RequestMapping(value = "/teachersan",method = RequestMethod.GET)
    public String teachersan(@RequestParam("stuid") String stuid,HttpSession httpSession){
      String msg =  teacherservice.teachersan(stuid);
        httpSession.setAttribute("msg",msg);
        return "success";
    }
    @RequestMapping(value = "/teacherzj",method = RequestMethod.GET)
    public String teacherzj(@RequestParam("stuid") String stuid,HttpSession httpSession){
        String msg = teacherservice.teacherzj(stuid);
        httpSession.setAttribute("msg",msg);
        return "success";
    }

    @RequestMapping(value = "/tearecord",method = RequestMethod.GET)
    public String tearecord(@RequestParam("stuid") String stuid,@RequestParam("record")String record,HttpSession httpSession){
        studentIF stIF =new studentIF();
        stIF.setStudentid(stuid);
        stIF.setRecord(record);

        String msg = teacherservice.setrecord(stIF);
        httpSession.setAttribute("msg",msg);
        return "success";
    }


}
