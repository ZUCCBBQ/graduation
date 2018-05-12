package course.graduation.Encode;

public class changeYesorNo {
    public  String chang(String input){
        String afterchang =null;
        if(input.equals("no")){
            afterchang="暂无";
        }
        else
            afterchang="已通过";
        return afterchang;
    }
    public String changerecord (String input){
        String record =null;
        if(input.equals("A")){
            record = "优秀";
        }
        else if(input.equals("B")){
            record= "良好";
        }
        else if(input.equals("C")){
            record= "及格";
        }
        else {
            record= "不及格";
        }

        return record;
    }
    public String changemajor(String input){
        String major=null;
        if(input.equals("js")){
            major="计算";
        }
        else if (input.equals("tj")){
            major="统计";

        }
        else if(input.equals("xg")){
            major="信管";
        }
        else {
            major="软件";
        }
        return major;
    }
    public String changetype(String input){
        String intershiptype=null;
        if(input.equals("renshi")){
            intershiptype="认识实习";
        }
        else if (input.equals("jiaoxue")){
            intershiptype="教学实习";

        }
        else{
            intershiptype="毕业实习";
        }

        return intershiptype;
    }

}
