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
          <span class="nav-link-text">我的主页</span>
        </a>
      </li>
      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
        <a class="nav-link" id="myst">
          <i class="fa fa-fw fa-area-chart"></i>
          <span class="nav-link-text">我的学生</span>
        </a>
      </li>
      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
        <a class="nav-link" id="download">
          <i class="fa fa-fw fa-table"></i>
          <span class="nav-link-text">里程碑</span>
        </a>
      </li>


      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Link">
        <a class="nav-link" id="btn3">
          <i class="fa fa-fw fa-link"></i>
          <span class="nav-link-text">企业列表</span>
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
    <div id="stulist"></div>
  </div>
  <div class="container-fluid" >
    <div id="teacherdownload"></div>
  </div>
<div class="container-fluid" >
  <div class="card mb-3" id="box1">
    <div class="card-header">
      <i class="fa fa-table"></i>我的信息</div>
     <div class="card-body">
      <div class="col-12">
        <h3>工号</h3>
        <p>${user.teacherid}</p>
        <h3>性别</h3>
        <p>${user.sex}</p>
        <h3>姓名</h3>
        <p>${user.name}</p>
        <h3>办公室地点</h3>
        <p>${user.officeplace}</p>
        <h3>介绍</h3>
        <p>${user.introduce}</p>
        <h3>邮箱</h3>
        <p>${user.email}</p>
        <h3>电话</h3>
        <p>${user.phone}</p>
      </div>
    </div>
  </div>
</div>
</div>

<!--  </div>
</div>
-->
<!-- /.container-fluid-->
<!-- /.content-wrapper-->
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
        <form id="logout" method="post" action="/logout">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">返回</button>
          <button class="btn btn-primary btn-block" type="submit">登出</button>
        </form>
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
        $("#box1").show();
        $("#box2").hide();
        $("#box3").hide();
        $("#box4").hide();
        $("#btn1").click(function(){
            $("#box1").show();
            $("#box2").hide();
            $("#box3").hide();
            $("#box4").hide();
        });

        $("#myst").click(function(){
            $("#box1").hide();
            $("#box3").hide();
            $("#box4").hide();
            $.ajax({
                data:{},
                tpye:"post",
                url:'/getstudentInfo',
                success:function(result){
                    console.log(result);
                    $("#stulist").html(result);
                },
                error:function(message){
                    loading.result(message);
                    isSubmiting = false;
                }
            });
        });

        $("#btn3").click(function(){
            $("#box1").hide();
            $("#box2").hide();
            $("#box4").hide();
            $.ajax({
                data:{},
                tpye:"post",
                url:'/allcompany',
                success:function(result){
                    console.log(result);
                    $("#stulist").html(result);
                },
                error:function(message){
                    loading.result(message);
                    isSubmiting = false;
                }
            });
        });
        $("#download").click(function(){
            $("#box1").hide();
            $("#box2").hide();
            $("#box3").hide();
            $.ajax({
                data:{},
                tpye:"post",
                url:'/getstuid',
                success:function(result){
                    console.log(result);
                    $("#teacherdownload").html(result);
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

    function f1(stuid){
        window.open("/downsan?stuid="+stuid)
        $.ajax({
            tpye:"get",
            url:'/downsan',
            dateType: 'json',
            data:{"stuid":stuid},
            success:function(zhaorenmsg){
                console.log(zhaorenmsg);

            },
            error:function(message){
                loading.result(message);
                isSubmiting = false;
            }
        });
    }

        function f2(stuid){
            window.open("/downsummry?stuid="+stuid)
            $.ajax({
                tpye:"get",
                url:'/downsummry',
                dateType: 'json',
                data:{"stuid":stuid},
                success:function(zhaorenmsg){
                    console.log(zhaorenmsg);

                },
                error:function(message){
                    loading.result(message);
                    isSubmiting = false;
                }
            });
        }
        function f3(stuid){
            window.open("/downzwjd?stuid="+stuid)
            $.ajax({
                tpye:"get",
                url:'/downzwjd',
                dateType: 'json',
                data:{"stuid":stuid},
                success:function(zhaorenmsg){
                    console.log(zhaorenmsg);

                },
                error:function(message){
                    loading.result(message);
                    isSubmiting = false;
                }
            });
        }
    function f4(stuid){

        $.ajax({
            tpye:"get",
            url:'/teachersan',
            dateType: 'json',
            data:{"stuid":stuid},
            success:function(msg){
                alert(msg)

            },
            error:function(message){
                loading.result(message);
                isSubmiting = false;
            }
        });
    }
    function f5(stuid){

        $.ajax({
            tpye:"get",
            url:'/tearecord',
            dateType: 'json',
            data:{"stuid":stuid,
            "record":$("#"+stuid).val()},
            success:function(msg){
                alert(msg)

            },
            error:function(message){
                loading.result(message);
                isSubmiting = false;
            }
        });
    }
</script>



</div>
</body>

</html>
