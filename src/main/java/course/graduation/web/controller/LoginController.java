package course.graduation.web.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

//使用@Controller来标识他是一个控制器
@Controller
public class LoginController {

    //注解的映射器和适配器配套使用，一般url的名字和方法名统一起来
    @RequestMapping(value = "/index")
    public String login(HttpSession httpSession) {
        return "studentindex";

    }

    @RequestMapping("/logout")
    public String logout(ModelMap modelMap, HttpSession httpSession) {
        modelMap.remove("user");
        httpSession.removeAttribute("user");
        return "login";
    }
}
