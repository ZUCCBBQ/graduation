<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030"
         pageEncoding="utf-8" isELIgnored="false"%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>计算分院毕业实习管理系统</title>

  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

  <!-- CSS Files -->
  <!-- Bootstrap core CSS-->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="/css/sb-admin.css" rel="stylesheet">

  <link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png" />
  <link rel="icon" type="image/png" href="/assets/img/favicon.png" />



  <!--<link href="/assets/css/material-bootstrap-wizard.css" rel="stylesheet" />-->

  <!--&lt;!&ndash; CSS Just for demo purpose, don't include it in your project &ndash;&gt;-->
  <!--<link href="/assets/css/demo.css" rel="stylesheet" />-->


</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark  bg-dark fixed-top" id="mainNav">
  <a class="navbar-brand" href="#">毕业实习管理网站</a>
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarResponsive">
    <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
        <a class="nav-link" id="btn1">
          <i class="fa fa-fw fa-area-chart"></i>
          <span class="nav-link-text">导入数据</span>
        </a>
      </li>
      <%--<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">--%>
        <%--<a class="nav-link" href="#">--%>
          <%--<i class="fa fa-fw fa-table"></i>--%>
          <%--<span class="nav-link-text">里程碑管理</span>--%>
        <%--</a>--%>
      <%--</li>--%>
      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
          <i class="fa fa-fw fa-wrench"></i>
          <span class="nav-link-text">信息管理</span>
        </a>
        <ul class="sidenav-second-level collapse" id="collapseComponents">
          <li>
            <a id="btn7">落实企业学生信息</a>
          </li>
          <li>
            <a id="btn2">未落实学生企业信息</a>
          </li>
          <li>
            <a id="btn12">学生现阶段成绩</a>
          </li>
        </ul>
      </li>
      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Example Pages">
        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseExamplePages" data-parent="#exampleAccordion">
          <i class="fa fa-fw fa-file"></i>
          <span class="nav-link-text">查看信息</span>
        </a>
        <ul class="sidenav-second-level collapse" id="collapseExamplePages">
          <li>
            <a id="btn4">所有老师</a>
          </li>
          <li>
            <a id="btn5">所有学生</a>
          </li>
          <li>
            <a id="btn6">所有企业</a>
          </li>
        </ul>
      </li>
      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Link">
        <a class="nav-link" id="btn13">
          <i class="fa fa-fw fa-link"></i>
          <span class="nav-link-text">学生三方信息</span>
        </a>
      </li>
    </ul>
    <ul class="navbar-nav sidenav-toggler">
      <li class="nav-item">
        <a class="nav-link text-center" id="sidenavToggler">
          <i class="fa fa-fw fa-angle-left"></i>
        </a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
          <i class="fa fa-fw fa-sign-out"></i>登出</a>
      </li>
    </ul>
  </div>
</nav>

<div class="content-wrapper">

  <div class="container-fluid" >
    <div id="student"></div>
  </div>
  <div class="container-fluid" >
    <div id="company"></div>
  </div>

  <div class="container-fluid" >
    <div id="teacher"></div>
  </div>
  <div class="container-fluid" >
    <div id="unworkstudent"></div>
  </div>
  <div class="container-fluid" >
    <div id="workstudent"></div>
  </div>
  <div class="container-fluid" >
    <div id="studentrecord"></div>
  </div>
  <div class="container-fluid" >
    <div id="san"></div>
  </div>




  <div class="container-fluid" >
    <div class="card mb-3 " id="box" >
      <div class="card-header">
        <i class="fa fa-table"></i>我的信息</div>
      <div class="card-body">
        <div class="col-12">
          <form action="/import" method="post" enctype="multipart/form-data">
            <input type="file" name="upfile" />
            <input type="submit" value="上传学生表格" />
          </form>
          <form action="/importeacher" method="post" enctype="multipart/form-data">
            <input type="file" name="upfile2" />
            <input type="submit" value="上传老师表格" />
          </form>
          <form action="/imporTandS" method="post" enctype="multipart/form-data">
            <input type="file" name="upfile3" />
            <input type="submit" value="上传关系表格" />
          </form>
        </div>
      </div>
    </div>
</div>

</div>
<footer class="sticky-footer">
  <div class="container">
    <div class="text-center">
      <small>Copyright © Your Website 2018</small>
    </div>
  </div>
</footer>
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fa fa-angle-up"></i>
</a>
<!-- Logout Modal-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">登出?</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">点击登出，退出当前账户.</div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">返回</button>
        <a class="btn btn-primary" href="/jsp/login.jsp">登出</a>
      </div>
    </div>
  </div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Page level plugin JavaScript-->
<script src="/vendor/chart.js/Chart.min.js"></script>
<script src="/vendor/datatables/jquery.dataTables.js"></script>
<script src="/vendor/datatables/dataTables.bootstrap4.js"></script>
<!-- Custom scripts for all pages-->
<script src="/js/sb-admin.min.js"></script>
<!-- Custom scripts for this page-->
<script src="/js/sb-admin-datatables.min.js"></script>
<script src="/js/sb-admin-charts.min.js"></script>
<script>
    $(function () {
        $("#box").show();
        $("#box1").hide();
        $("#box2").hide();
        $("#box3").hide();
        $("#box4").hide();
        $("#box5").hide();
        $("#box6").hide();
        $("#box7").hide();
        $("#box11").hide();
        $("#box13").hide();
        $("#btn1").click(function(){
            $("#box").show();
            $("#box2").hide();
            $("#box3").hide();
            $("#box4").hide();
            $("#box5").hide();
            $("#box6").hide();
            $("#box7").hide();
            $("#box11").hide();
            $("#box13").hide();
        });
        $("#btn5").click(function(){
            $("#box").hide();
            $("#box1").hide();
            $("#box2").hide();
            $("#box3").hide();
            $("#box4").hide();
            $("#box6").hide();
            $("#box7").hide();
            $("#box11").hide();
            $("#box13").hide();
            $.ajax({
                data:{},
                tpye:"get",
                url:'/jxbgetstudent',
                success:function(result){
                    console.log(result);
                    $("#student").html(result);
                },
                error:function(message){
                    loading.result(message);
                    isSubmiting = false;
                }
            });
        });
        //
        $("#btn6").click(function(){
            $("#box").hide();
            $("#box1").hide();
            $("#box2").hide();
            $("#box5").hide();
            $("#box4").hide();
            $("#box3").hide();
            $("#box7").hide()
            $("#box13").hide();
            $("#box11").hide();
            $.ajax({
                data:{},
                tpye:"post",
                url:'/allcompany',
                success:function(zhaorenmsg){
                    console.log(zhaorenmsg);
                    $("#company").html(zhaorenmsg);

                },
                error:function(message){
                    loading.result(message);
                    isSubmiting = false;
                }
            });
        });
        $("#btn4").click(function(){
            $("#box").hide();
            $("#box1").hide();
            $("#box2").hide();
            $("#box3").hide();
            $("#box13").hide();
            $("#box6").hide();
            $("#box5").hide();
            $("#box7").hide();
            $("#box4").hide();
            $("#box11").hide();
            $.ajax({
                data:{},
                tpye:"get",
                url:'/jxbgetteacher',
                success:function(zhaorenmsg){
                    console.log(zhaorenmsg);
                    $("#teacher").html(zhaorenmsg);

                },
                error:function(message){
                    loading.result(message);
                    isSubmiting = false;
                }
            });
        });
        $("#btn7").click(function(){
            $("#box").hide();
            $("#box1").hide();
            $("#box2").hide();
            $("#box4").hide();
            $("#box11").hide();
            $("#box3").hide();
            $("#box6").hide();

            $("#box5").hide();
            $("#box13").hide();
            $.ajax({
                data:{},
                tpye:"get",
                url:'/workstudent',
                success:function(zhaorenmsg){
                    console.log(zhaorenmsg);
                    $("#workstudent").html(zhaorenmsg);

                },
                error:function(message){
                    loading.result(message);
                    isSubmiting = false;
                }
            });
        });
        $("#btn2").click(function(){
            $("#box").hide();
            $("#box1").hide();
            $("#box7").hide();
            $("#box13").hide();
            $("#box4").hide();
            $("#box3").hide();
            $("#box6").hide();
            $("#box5").hide();
            $("#box11").hide();
            $.ajax({
                data:{},
                tpye:"get",
                url:'/unworkstudent',
                success:function(zhaorenmsg){
                    console.log(zhaorenmsg);
                    $("#unworkstudent").html(zhaorenmsg);

                },
                error:function(message){
                    loading.result(message);
                    isSubmiting = false;
                }
            });
        });

        $("#btn12").click(function(){
            $("#box").hide();
            $("#box1").hide();
            $("#box2").hide();
            $("#box4").hide();
            $("#box13").hide();
            $("#box3").hide();
            $("#box6").hide();
            $("#box7").hide();
            $("#box5").hide();
            $.ajax({
                data:{},
                tpye:"get",
                url:'/studentrecord',
                success:function(zhaorenmsg){
                    console.log(zhaorenmsg);
                    $("#studentrecord").html(zhaorenmsg);

                },
                error:function(message){
                    loading.result(message);
                    isSubmiting = false;
                }
            });
        });
        $("#btn13").click(function(){
            $("#box").hide();
            $("#box1").hide();
            $("#box2").hide();
            $("#box4").hide();
            $("#box11").hide();
            $("#box3").hide();
            $("#box6").hide();
            $("#box7").hide();
            $("#box5").hide();
            $.ajax({
                data:{},
                tpye:"get",
                url:'/san',
                success:function(zhaorenmsg){
                    console.log(zhaorenmsg);
                    $("#san").html(zhaorenmsg);

                },
                error:function(message){
                    loading.result(message);
                    isSubmiting = false;
                }
            });
        });
    })





</script>
<script>

    function record(){
        window.open("/outrecord")

    }
    function workstu(){
        window.open("/outwork")

    }
    function unworkstu(){
        window.open("/outunwork")
    }
</script>
</div>
</body>

</html>
