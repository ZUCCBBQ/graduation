package course.graduation.service.imp;

import course.graduation.Encode.ExcelUtil;
import course.graduation.Encode.changeYesorNo;
import course.graduation.dao.companydao;
import course.graduation.dao.studentIFdao;
import course.graduation.dao.studentdao;
import course.graduation.dao.teacherdao;
import course.graduation.model.*;
import course.graduation.service.Jxbservice;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.beans.IntrospectionException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class Jxbimp implements Jxbservice {
    private studentIFdao studentIFdao;
    private studentdao studentdao;
    private companydao companydao;
    private teacherdao teacherdao;
    @Autowired
    public void setStudentIFdao(course.graduation.dao.studentIFdao studentIFdao) {
        this.studentIFdao = studentIFdao;
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
    public void setTeacherdao(course.graduation.dao.teacherdao teacherdao) {
        this.teacherdao = teacherdao;
    }

    public  void importExcelTandS(InputStream in, MultipartFile file) throws Exception{
        List<List<Object>> listob = ExcelUtil.getBankListByExcel(in,file.getOriginalFilename());
        List<studentIF> studentList = new ArrayList<studentIF>();

        //遍历listob数据，把数据放到List中
        for (int i = 0; i < listob.size(); i++) {
            List<Object> ob = listob.get(i);
            studentIF studentIF = new studentIF();
            //设置编号
            //通过遍历实现把每一列封装成一个model中，再把所有的model用List集合装载
            studentIF.setStudentid(String.valueOf(ob.get(0)));
            studentIF.setTeacheridBystudent(String.valueOf(ob.get(2)));
            studentList.add(studentIF);
        }
        studentIFdao.insertSTrelation(studentList);
    }
    public  List<workstudent> Getworkstudent(){
        List <workstudent> workstudents = new ArrayList<workstudent>() ;
        List<studentIF> studentIF = studentIFdao.getwork();
        for(int i= 0;i<studentIF.size();i++){
            workstudent ws = new workstudent();
            student st = studentdao.Getinformation(studentIF.get(i).getStudentid());
            company com = companydao.Getinformation(studentIF.get(i).getCompanyidBystudent());
            teacher tea = teacherdao.Getinformation(studentIF.get(i).getTeacheridBystudent());
            ws.setStudentid(st.getStudentid());
            ws.setStudentname(st.getName());
            ws.setSex(st.getSex());
            ws.setMajorclass(st.getMajorclass());
            ws.setTeacher(tea.getName());
            ws.setCompanyname(com.getCompanyname());
            ws.setComanyphone(com.getPhone());
            ws.setManagername(com.getManagername());

            workstudents.add(ws);
        }
        return workstudents;
    }
    public  List<unworkstudent> Getunworkstudent(){
        List <unworkstudent> unworkstudents = new ArrayList<unworkstudent>() ;
        List<studentIF> studentIF = studentIFdao.getunwork();
        for(int i= 0;i<studentIF.size();i++){
            unworkstudent unws = new unworkstudent();
            student st = studentdao.Getinformation(studentIF.get(i).getStudentid());

            teacher tea = teacherdao.Getinformation(studentIF.get(i).getTeacheridBystudent());
            unws.setStudentid(st.getStudentid());
            unws.setStudentname(st.getName());
            unws.setSex(st.getSex());
            unws.setMajorclass(st.getMajorclass());
            unws.setTeacher(tea.getName());

            unworkstudents.add(unws);
        }
        return unworkstudents;
    }

    public XSSFWorkbook outwork() throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException, IntrospectionException, ParseException {
        //根据条件查询数据，把数据装载到一个list中
        List<workstudent> list = Getworkstudent();

        List<ExcelBean> excel=new ArrayList<ExcelBean>();
        Map<Integer,List<ExcelBean>> map=new LinkedHashMap<Integer,List<ExcelBean>>();
        XSSFWorkbook xssfWorkbook=null;
        //设置标题栏
        excel.add(new ExcelBean("学号","studentid",0));
        excel.add(new ExcelBean("姓名","studentname",0));
        excel.add(new ExcelBean("性别","sex",0));
        excel.add(new ExcelBean("专业班级","majorclass",0));
        excel.add(new ExcelBean("校内指导老师","teacher",0));
        excel.add(new ExcelBean("所在企业","companyname",0));
        excel.add(new ExcelBean("企业联系方式","comanyphone",0));
        excel.add(new ExcelBean("企业指导老师","managername",0));
        map.put(0, excel);
        String sheetName = "落实实习学生";
        //调用ExcelUtil的方法
        xssfWorkbook = ExcelUtil.createExcelFile(workstudent.class, list, map, sheetName);
        return xssfWorkbook;
    }

    public XSSFWorkbook outunwork() throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException, IntrospectionException, ParseException {
        //根据条件查询数据，把数据装载到一个list中
        List<unworkstudent> list = Getunworkstudent();

        List<ExcelBean> excel=new ArrayList<ExcelBean>();
        Map<Integer,List<ExcelBean>> map=new LinkedHashMap<Integer,List<ExcelBean>>();
        XSSFWorkbook xssfWorkbook=null;
        //设置标题栏
        excel.add(new ExcelBean("学号","studentid",0));
        excel.add(new ExcelBean("姓名","studentname",0));
        excel.add(new ExcelBean("性别","sex",0));
        excel.add(new ExcelBean("专业班级","majorclass",0));
        excel.add(new ExcelBean("校内指导老师","teacher",0));

        map.put(0, excel);
        String sheetName = "未落实实习学生";
        //调用ExcelUtil的方法
        xssfWorkbook = ExcelUtil.createExcelFile(unworkstudent.class, list, map, sheetName);
        return xssfWorkbook;
    }










    public  List<studentrecord> Getsturecord(){
        List<studentrecord> studentrecordList = new ArrayList<studentrecord>();
        List<studentIF> studentIFS = studentIFdao.GetAll();
        String stuid;
        String comid;
        String teaid;
        changeYesorNo change = new changeYesorNo();
        for(int i = 0;i<studentIFS.size();i++){
            studentrecord sr = new studentrecord();
            company com = new company();
            teacher tea = new teacher();
            student stu = new student();
            String zw = "暂无";
            stuid = studentIFS.get(i).getStudentid();
            comid = studentIFS.get(i).getCompanyidBystudent();
            teaid = studentIFS.get(i).getTeacheridBystudent();
            sr.setStudentid(stuid);
            sr.setStudentname(studentdao.Getinformation(stuid).getName());
            sr.setTeacher(teacherdao.Getinformation(teaid).getName());
            if(comid==null||"".equals(comid)){
                sr.setCompany("未入职");
            }else{
                sr.setCompany(companydao.Getinformation(comid).getCompanyname());
            }

            if(studentIFS.get(i).getRecord()==null||"".equals(studentIFS.get(i).getRecord())){
                sr.setRecord(zw);
            }
            else {
                sr.setRecord(studentIFS.get(i).getRecord());
            }
            sr.setSancompany(change.chang(studentIFS.get(i).getSanbycompany()));
            sr.setSanteacher(change.chang(studentIFS.get(i).getSanbyteacher()));
            sr.setZjcompany(change.chang(studentIFS.get(i).getZjbycompany()));
            sr.setZjteacher(change.chang(studentIFS.get(i).getZjbyteacher()));
            studentrecordList.add(sr);
        }
        return studentrecordList;
    }
    public XSSFWorkbook outrecord() throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException, IntrospectionException, ParseException {
        //根据条件查询数据，把数据装载到一个list中
        List<studentrecord> list = Getsturecord();

        List<ExcelBean> excel=new ArrayList<ExcelBean>();
        Map<Integer,List<ExcelBean>> map=new LinkedHashMap<Integer,List<ExcelBean>>();
        XSSFWorkbook xssfWorkbook=null;
        //设置标题栏
        excel.add(new ExcelBean("学号","studentid",0));
        excel.add(new ExcelBean("姓名","studentname",0));
        excel.add(new ExcelBean("指导老师","teacher",0));
        excel.add(new ExcelBean("所在企业","company",0));
        excel.add(new ExcelBean("企业三方确认","sancompany",0));
        excel.add(new ExcelBean("老师三方确认","santeacher",0));
        excel.add(new ExcelBean("企业总结确认","zjcompany",0));
        excel.add(new ExcelBean("老师总结确认","zjteacher",0));
        excel.add(new ExcelBean("得分","record",0));

        map.put(0, excel);
        String sheetName = "学生成绩";
        //调用ExcelUtil的方法
        xssfWorkbook = ExcelUtil.createExcelFile(studentrecord.class, list, map, sheetName);
        return xssfWorkbook;
    }



}
