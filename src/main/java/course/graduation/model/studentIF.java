package course.graduation.model;

/**
 * Created by bboymc on 2018/5/5.
 */
public class studentIF {
    private String studentid;
    private String teacheridBystudent;
    private String companyidBystudent;
    private String sanbycompany;
    private String sanbyteacher;
    private String zjbycompany;
    private String zjbyteacher;
    private String record;
    private String markstudent;//录用标签

    public String getMarkstudent() {
        return markstudent;
    }

    public void setMarkstudent(String markstudent) {
        this.markstudent = markstudent;
    }

    public String getSanbycompany() {
        return sanbycompany;
    }

    public void setSanbycompany(String sanbycompany) {
        this.sanbycompany = sanbycompany;
    }

    public String getSanbyteacher() {
        return sanbyteacher;
    }

    public void setSanbyteacher(String sanbyteacher) {
        this.sanbyteacher = sanbyteacher;
    }

    public String getZjbycompany() {
        return zjbycompany;
    }

    public void setZjbycompany(String zjbycompany) {
        this.zjbycompany = zjbycompany;
    }

    public String getZjbyteacher() {
        return zjbyteacher;
    }

    public void setZjbyteacher(String zjbyteacher) {
        this.zjbyteacher = zjbyteacher;
    }

    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentid) {
        this.studentid = studentid;
    }

    public String getTeacheridBystudent() {
        return teacheridBystudent;
    }

    public void setTeacheridBystudent(String teacheridBystudent) {
        this.teacheridBystudent = teacheridBystudent;
    }

    public String getCompanyidBystudent() {
        return companyidBystudent;
    }

    public void setCompanyidBystudent(String companyidBystudent) {
        this.companyidBystudent = companyidBystudent;
    }


    public String getRecord() {
        return record;
    }

    public void setRecord( String record) {
        this.record = record;
    }


}

