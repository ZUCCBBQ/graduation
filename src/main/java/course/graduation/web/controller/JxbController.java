package course.graduation.web.controller;

import course.graduation.model.*;
import course.graduation.service.Jxbservice;
import course.graduation.service.studentservice;
import course.graduation.service.teacherservice;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.beans.IntrospectionException;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class JxbController {
    private studentservice studentservice;
    private teacherservice teacherservice;
    private Jxbservice jxbservice;
    @Autowired
    public void setStudentservice(course.graduation.service.studentservice studentservice) {
        this.studentservice = studentservice;
    }
    @Autowired
    public void setTeacherservice(course.graduation.service.teacherservice teacherservice) {
        this.teacherservice = teacherservice;
    }
    @Autowired
    public void setJxbservice(Jxbservice jxbservice) {
        this.jxbservice = jxbservice;
    }

    @RequestMapping("/import")
    public String impotr(HttpServletRequest request, HttpSession httpSession) throws Exception {

        //获取上传的文件
        MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
        MultipartFile file = multipart.getFile("upfile");
        if(file.isEmpty()){
            httpSession.setAttribute("msg","文件为空");
            return "error";
        }

        InputStream in = file.getInputStream();
        //数据导入
        studentservice.importExcellnfo(in,file);

        in.close();
        return "success";

    }
    @RequestMapping("/importeacher")
    public String importeacher(HttpServletRequest request, HttpSession httpSession) throws Exception {

        //获取上传的文件
        MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
        MultipartFile file = multipart.getFile("upfile2");
        if(file.isEmpty()){
            httpSession.setAttribute("msg","文件为空");
            return "error";
        }

        InputStream in = file.getInputStream();
        //数据导入
        teacherservice.importExcellnfo(in,file);
        in.close();
        return "success";
    }
    @RequestMapping("/imporTandS")
    public String relationship(HttpServletRequest request, HttpSession httpSession) throws Exception {

        //获取上传的文件
        MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
        MultipartFile file = multipart.getFile("upfile3");
        if(file.isEmpty()){
            httpSession.setAttribute("msg","文件为空");
            return "error";
        }

        InputStream in = file.getInputStream();
        //数据导入
        jxbservice.importExcelTandS(in,file);
        in.close();
        return "success";
    }

    @RequestMapping(value = "/jxbgetstudent",method = RequestMethod.GET)
    public String jxbgetstudent(HttpSession httpSession){
        List<student> studnetList = studentservice.GetAllstudent();
        httpSession.setAttribute("studenttable",studnetList);
        return "studenttable";
    }
    @RequestMapping(value = "/jxbgetteacher",method = RequestMethod.GET)
    public String jxbgetteacher(HttpSession httpSession){
        List<teacher> teacherList = teacherservice.GetAllteacher();
        httpSession.setAttribute("teachertable",teacherList);
        return "teachertable";
    }

    @RequestMapping(value = "/workstudent",method = RequestMethod.GET)
    public String workstudent(HttpSession httpSession){
        List<workstudent> workstudents = jxbservice.Getworkstudent();
        httpSession.setAttribute("workstudents",workstudents);
        return "workstudent";
    }

    @RequestMapping(value = "/unworkstudent",method = RequestMethod.GET)
    public String unworkstudent(HttpSession httpSession){
        List<unworkstudent> unworkstudents = jxbservice.Getunworkstudent();
        httpSession.setAttribute("unworkstudents",unworkstudents);
        return "unworkstudent";
    }

    @RequestMapping(value = "/studentrecord",method = RequestMethod.GET)
    public String studentrecord(HttpSession httpSession){
        List<studentrecord> studentrecordList = jxbservice.Getsturecord();
        httpSession.setAttribute("studentrecordList",studentrecordList);
        return "studentrecord";
    }
    @RequestMapping(value = "/san",method = RequestMethod.GET)
    public String san(HttpSession httpSession){
        List<san> sanList = studentservice.getallsan();
        httpSession.setAttribute("sanList",sanList);
        return "santable";
    }














    @RequestMapping("/outunwork")
    public @ResponseBody void outunwork(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, IntrospectionException, IllegalAccessException, ParseException, InvocationTargetException ,ClassNotFoundException, IntrospectionException, IllegalAccessException, ParseException, InvocationTargetException {


        response.reset(); //清除buffer缓存
        Map<String,Object> map=new HashMap<String,Object>();
        // 指定下载的文件名
        response.setHeader("Content-Disposition", "attachment;filename="+"unworkstudent"+".xlsx");
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        XSSFWorkbook workbook=null;
        //导出Excel对象
        workbook = jxbservice.outunwork();
        OutputStream output;
        try {
            output = response.getOutputStream();
            BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
            bufferedOutPut.flush();
            workbook.write(bufferedOutPut);
            bufferedOutPut.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    @RequestMapping("/outwork")
    public @ResponseBody void outwork(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, IntrospectionException, IllegalAccessException, ParseException, InvocationTargetException ,ClassNotFoundException, IntrospectionException, IllegalAccessException, ParseException, InvocationTargetException {


            response.reset(); //清除buffer缓存
            Map<String,Object> map=new HashMap<String,Object>();
            // 指定下载的文件名
            response.setHeader("Content-Disposition", "attachment;filename="+"workstudent"+".xlsx");
            response.setContentType("application/vnd.ms-excel;charset=UTF-8");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            XSSFWorkbook workbook=null;
            //导出Excel对象
            workbook = jxbservice.outwork();
            OutputStream output;
            try {
                output = response.getOutputStream();
                BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
                bufferedOutPut.flush();
                workbook.write(bufferedOutPut);
                bufferedOutPut.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

    }





    @RequestMapping("/outrecord")
    public @ResponseBody void outrecord(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, IntrospectionException, IllegalAccessException, ParseException, InvocationTargetException ,ClassNotFoundException, IntrospectionException, IllegalAccessException, ParseException, InvocationTargetException {


        response.reset(); //清除buffer缓存
        Map<String,Object> map=new HashMap<String,Object>();
        // 指定下载的文件名
        response.setHeader("Content-Disposition", "attachment;filename="+"studentrecord"+".xlsx");
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        XSSFWorkbook workbook=null;
        //导出Excel对象
        workbook = jxbservice.outrecord();
        OutputStream output;
        try {
            output = response.getOutputStream();
            BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
            bufferedOutPut.flush();
            workbook.write(bufferedOutPut);
            bufferedOutPut.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
