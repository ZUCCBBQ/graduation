package course.graduation.service;

import course.graduation.model.studentrecord;
import course.graduation.model.unworkstudent;
import course.graduation.model.workstudent;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import java.beans.IntrospectionException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.List;

public interface Jxbservice {
    void importExcelTandS(InputStream in, MultipartFile file) throws Exception;
    List<workstudent> Getworkstudent();
    List<unworkstudent> Getunworkstudent();
    List<studentrecord> Getsturecord();
    XSSFWorkbook outrecord() throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException, IntrospectionException, ParseException;
    XSSFWorkbook outwork() throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException, IntrospectionException, ParseException ;
    XSSFWorkbook outunwork() throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException, IntrospectionException, ParseException ;
}
