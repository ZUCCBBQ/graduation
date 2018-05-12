package course.graduation.dao;

import course.graduation.model.STandCO;

import java.util.List;


public interface STandCOdao {
        List<STandCO> getstudentlist(String companyid);
        void studentinsert(STandCO sTandCO);
        List<STandCO> getbystid(String studentid);
}
