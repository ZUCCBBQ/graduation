package course.graduation.service.imp;


import course.graduation.dao.companydao;
import course.graduation.model.company;
import course.graduation.service.xgbservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class xgbimp implements xgbservice {
    private companydao companydao;
    @Autowired
    public void setCompanydao(course.graduation.dao.companydao companydao) {
        this.companydao = companydao;
    }
    public void changeright(String companyid){
        company a = companydao.Getinformation(companyid);
        if(a.getRight().equals("yes")){
            companydao.changerightno(companyid);
        }
        else{
            companydao.changerightok(companyid);
        }

    }
}
