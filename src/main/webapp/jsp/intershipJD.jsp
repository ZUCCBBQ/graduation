<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false"%>

<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>实习鉴定表</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="/assets/img/favicon.png" />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/assets/css/material-bootstrap-wizard.css" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="/assets/css/demo.css" rel="stylesheet" />
</head>

<body>
 <div class="image-container set-full-height" style="background-image: url('/assets/img/IMG_3715.JPG')">
        <!--   Big container   -->
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">
                    <!--      Wizard container        -->
                    <div class="wizard-container">
                        <div class="card wizard-card" data-color="purple" id="wizard">
                            <form action="/intership" method="post">
                                <!--        You can switch " data-color="rose" "  with one of the next bright colors: "blue", "green", "orange", "purple"        -->
                                <div class="wizard-header">
                                    <h3 class="wizard-title">
                                        实习鉴定表
                                    </h3>
                                    <h5>请如实填写</h5>
                                </div>
                                <div class="wizard-navigation">
                                    <ul>
                                        <li><a href="#location" data-toggle="tab">个人信息</a></li>
                                        <li><a href="#type" data-toggle="tab">企业信息</a></li>
                                    </ul>
                                </div>
                                <div class="tab-content">
                                    <div class="tab-pane" id="location">
                                        <!-- <div class="row"> -->
                                        <div class="col-sm-5 col-sm-offset-1">
                                            <div class="form-group label-floating">
                                                <label class="control-label">姓名</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" name="studentname">
                                            </div>
                                        </div>
                                        <div class="col-sm-5 col-sm-offset-1">
                                            <div class="form-group label-floating">
                                                <label class="control-label">学号</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" name="studentid">
                                            </div>
                                        </div>
                                        <div class="col-sm-5 col-sm-offset-1">
                                            <div class="form-group label-floating">
                                                <label class="control-label">联系电话</label>
                                                <input type="text" class="form-control" id="exampleInputEmail2" name="tel">
                                            </div>
                                        </div>
                                        <div class="col-sm-5">
                                            <div class="form-group label-floating">
                                                <label class="control-label">专业</label>
                                                <select name="major" class="form-control">
                                                    <option disabled="" selected=""></option>
                                                    <option value="js">计算</option>
                                                    <option value="tj">统计</option>
                                                    <option value="xg">信管</option>
                                                    <option value="rj">软件</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-5">
                                            <div class="form-group label-floating">
                                                <label class="control-label">班级</label>
                                                <select name="class" class="form-control">
                                                    <option disabled="" selected=""></option>
                                                    <option value="01">01</option>
                                                    <option value="02">02</option>
                                                    <option value="03">03</option>
                                                    <option value="04">04</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="type">
                                        <div class="col-sm-5 col-sm-offset-1">
                                            <div class="form-group label-floating">
                                                <label class="control-label">企业名称</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" name="companyname">
                                            </div>
                                        </div>
                                        <div class="col-sm-5 col-sm-offset-1">
                                            <div class="form-group label-floating">
                                                <label class="control-label">实习地点</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" name="place">
                                            </div>
                                        </div>
                                        <div class="col-sm-5 col-sm-offset-1">
                                            <div class="form-group label-floating">
                                                <label class="control-label">岗位名称</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" name="position">
                                            </div>
                                        </div>
                                        <div class="col-sm-5 col-sm-offset-1">
                                            <div class="form-group label-floating">
                                                <label class="control-label">实习类型</label>
                                                <select class="form-control" name="type">
                                                    <option value="renshi">认识实习</option>
                                                    <option value="jiaoxue">教学实习</option>
                                                    <option value="biye">毕业实习</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-5 col-sm-offset-1">
                                            <div class="form-group label-floating">
                                                <label class="control-label">实习开始日期</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" name="begintime">
                                            </div>
                                        </div>
                                        <div class="col-sm-5 col-sm-offset-1">
                                            <div class="form-group label-floating">
                                                <label class="control-label">实习结束日期</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1" name="endtime">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="facilities">
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <!--                                                 <div class="form-group label-floating">
                                                    <label class="control-label">Is air conditioning included ?</label>
                                                    <select class="form-control">
                                                        <option disabled="" selected=""></option>
                                                        <option>Yes</option>
                                                        <option>No </option>
                                                    </select>
                                                </div> -->
                                                <%--<form action="/upsummry" method="post" enctype="multipart/form-data" accept-charset="utf-8">--%>
                                                <%--<input type="file" name="upsummry" />--%>
                                                <%--<input type="submit" value="上传总结报告" />--%>
                                                <%--</form>--%>
                                                <%--<form action="/upzwjd" method="post" enctype="multipart/form-data" accept-charset="utf-8">--%>
                                                <%--<input type="file" name="upzwjd" />--%>
                                                <%--<input type="submit" value="上传自我鉴定" />--%>
                                                <%--</form>--%>
                                                <!--                                                 <div class="form-group label-floating">
                                                    <label class="control-label">Does your place have wi-fi?</label>
                                                    <select class="form-control">
                                                        <option disabled="" selected=""></option>
                                                        <option>Yes</option>
                                                        <option>No </option>
                                                    </select>
                                                </div> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="wizard-footer">
                                    <div class="pull-right">
                                        <input type='button' class='btn btn-next btn-fill btn-primary btn-wd' name='next' value='下一页' />
                                        <input type='submit' class='btn btn-finish btn-fill btn-primary btn-wd' name='finish' value='提交' />
                                    </div>
                                    <div class="pull-left">
                                        <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='上一页' />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </form>
                        </div>

                    </div>
                    <!-- wizard container -->
                </div>
            </div>
            <!-- row -->
        </div>
        <!--  big container -->
    </div>
</body>
<!--   Core JS Files   -->
<script src="/assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="/assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/assets/js/jquery.bootstrap.js" type="text/javascript"></script>
<!--  Plugin for the Wizard -->
<script src="/assets/js/material-bootstrap-wizard.js"></script>
<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
<script src="/assets/js/jquery.validate.min.js"></script>

</html>