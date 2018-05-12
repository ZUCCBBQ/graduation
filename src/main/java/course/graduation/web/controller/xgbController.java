package course.graduation.web.controller;

import course.graduation.model.company;
import course.graduation.service.companyservice;
import course.graduation.service.xgbservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.List;

@Controller


public class xgbController {
    private companyservice companyservice;
    private xgbservice xgbservice;
    @Autowired
    public void setCompanyservice(course.graduation.service.companyservice companyservice) {
        this.companyservice = companyservice;
    }
    @Autowired
    public void setXgbservice(course.graduation.service.xgbservice xgbservice) {
        this.xgbservice = xgbservice;
    }

    @RequestMapping(value = "/judgeallcompany",method = RequestMethod.GET)
    public String judgeallcompany(HttpSession httpSession){
        List<company> result = companyservice.GetAllRight();

        httpSession.setAttribute("result",result);
        return "xgbCOMtable";
    }
    @RequestMapping(value = "/changeright",method = RequestMethod.GET)
    public String changeright(@RequestParam("comid") String companyid,HttpSession httpSession){
        xgbservice.changeright(companyid);
        httpSession.setAttribute("msg","操作成功");
        return "success";
    }
    @RequestMapping("/importcompany")
    public String importcompany(HttpServletRequest request,HttpSession httpSession) throws Exception {
        //获取上传的文件
        MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
        MultipartFile file = multipart.getFile("upcompany");
        if(file.isEmpty()){
            httpSession.setAttribute("msg","文件为空");
            return "error";
        }

        InputStream in = file.getInputStream();
        //数据导入
        companyservice.importExcellnfo(in,file);
        in.close();
        return "success";
    }


}
