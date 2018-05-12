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
      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
        <a class="nav-link" id="btn1">
          <i class="fa fa-fw fa-dashboard"></i>
          <span class="nav-link-text">企业资格审查</span>
        </a>
      </li>
      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
        <a class="nav-link" id="btn4">
          <i class="fa fa-fw fa-table"></i>
          <span class="nav-link-text">所有企业</span>
        </a>
      </li>
      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
          <i class="fa fa-fw fa-wrench"></i>
          <span class="nav-link-text">信息管理</span>
        </a>
        <ul class="sidenav-second-level collapse" id="collapseComponents">
          <li>
            <a id="btn2">落实企业学生信息</a>
          </li>
          <li>
            <a id="btn3">未落实企业信息</a>
          </li>
        </ul>
      </li>
      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Link">
        <a class="nav-link" id="btn5">
          <i class="fa fa-fw fa-link"></i>
          <span class="nav-link-text">上传企业</span>
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
    <div id="company"></div>
  </div>

  <div class="container-fluid" >
    <div id="workstudent"></div>
  </div>

  <div class="container-fluid" >
    <div id="unworkstudent"></div>
  </div>
  <div class="container-fluid" >
    <div id="allcompany"></div>
  </div>
  <div class="container-fluid" >
    <div id="inputcompany"></div>
  </div>
  <div class="container-fluid" >
    <div class="card mb-3 " id="box4" >
        <div class="col-12">
          <form action="/importcompany" method="post" enctype="multipart/form-data">
            <input type="file" name="upcompany" />
            <input type="submit" value="上传企业表格" />
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

</div>
<script>
    $(function () {
        $("#box1").show();
        $("#box2").hide();
        $("#box7").hide();
        $("#box3").hide();
        $("#box4").hide();
        $("#btn5").click(function(){

            $("#box4").show();
            $("#box2").hide();
            $("#box3").hide();
            $("#box1").hide();
            $("#box7").hide();

        });

        $("#btn1").click(function(){
//            $("#box").hide();
            $("#box2").hide();
            $("#box7").hide();
            $("#box3").hide();
            $("#box4").hide();
//            $("#box5").hide();
            $.ajax({
                data:{},
                tpye:"Get",
                url:'/judgeallcompany',
                success:function(result){
                    console.log(result);
                    $("#company").html(result);
                },
                error:function(message){
                    loading.result(message);
                    isSubmiting = false;
                }
            });
        });
        $("#btn2").click(function(){
            $("#box1").hide();
            $("#box2").hide();
            $("#box3").hide();
            $("#box4").hide();
//            $("#box4").hide();
//            $("#box5").hide();
            $.ajax({
                data:{},
                tpye:"Get",
                url:'/workstudent',
                success:function(result){
                    console.log(result);
                    $("#workstudent").html(result);
                },
                error:function(message){
                    loading.result(message);
                    isSubmiting = false;
                }
            });
        });
        $("#btn3").click(function(){
            $("#box1").hide();
            $("#box7").hide();
            $("#box4").hide();
            $("#box3").hide();
//            $("#box4").hide();
//            $("#box5").hide();
            $.ajax({
                data:{},
                tpye:"Get",
                url:'/unworkstudent',
                success:function(result){
                    console.log(result);
                    $("#unworkstudent").html(result);
                },
                error:function(message){
                    loading.result(message);
                    isSubmiting = false;
                }
            });
        });
        $("#btn4").click(function(){
            $("#box1").hide();
            $("#box2").hide();
            $("#box4").hide();
            $("#box7").hide();
//            $("#box4").hide();
//            $("#box5").hide();
            $.ajax({
                data:{},
                tpye:"Get",
                url:'/allcompany',
                success:function(result){
                    console.log(result);
                    $("#allcompany").html(result);
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
    function f1(comid){
        $.ajax({
            tpye:"Get",
            url:'/changeright',
            dateType: 'json',
            data:{"comid":comid},
            success:function(result){
                alert(result);
            },
            error:function(result){
                alert(result);
            }
        });
    }
</script>
</body>

</html>
