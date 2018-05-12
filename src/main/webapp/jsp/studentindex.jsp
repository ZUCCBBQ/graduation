<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030"
         pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="course.graduation.model.student" %>
<%@ page import="course.graduation.dao.studentdao" %>
<%@ page import="course.graduation.model.users" %>
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
        <a class="nav-link" id="btn2">
          <i class="fa fa-fw fa-area-chart"></i>
          <span class="nav-link-text">我的指导老师</span>
        </a>
      </li>
      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
        <a class="nav-link" id="lcb">
          <i class="fa fa-fw fa-table"></i>
          <span class="nav-link-text">里程碑</span>
        </a>
      </li>
      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion" >
          <i class="fa fa-fw fa-wrench"></i>
          <span class="nav-link-text">企业列表信息</span>
        </a>
        <ul class="sidenav-second-level collapse" id="collapseComponents">
          <li>
            <a id="btn3" href="#">所有企业</a>
          </li>
          <li>
            <a id="zhaoren" href="#">招人企业</a>
          </li>
        </ul>
      </li>
      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Link">
        <a class="nav-link" id="JL">
          <i class="fa fa-fw fa-link"></i>
          <span class="nav-link-text">我的简历</span>
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
    <div id="companydiv"></div>
  </div>
  <div class="container-fluid" >
    <div id="zhaorendiv"></div>
  </div>


  <div class="container-fluid" >
    <div class="card mb-3 " id="box" >
      <div class="card-header">
        <i class="fa fa-table"></i>我的信息</div>
      <div class="card-body">
        <div class="col-12">

          <h3>学号：</h3>
          <p style="white-space:nowrap">${user.studentid}</p>
          <h3>性别：</h3>
          <p style="white-space:nowrap">${user.sex}</p>
          <h3>姓名：</h3>
          <p style="white-space:nowrap">${user.name}</p>
          <h3>专业班级：</h3>
          <p style="white-space:nowrap">${user.majorclass}</p>
        </div>
      </div>
    </div>

    <div class="card mb-3 " id="box2" >
      <div class="card-header">
        <i class="fa fa-table"></i>指导老师信息</div>
      <div class="card-body">
        <div class="col-12">
          <h3>工号：</h3>
          <p style="white-space:nowrap">${teacher.teacherid}</p>
          <h3>性别：</h3>
          <p style="white-space:nowrap">${teacher.sex}</p>
          <h3>姓名：</h3>
          <p style="white-space:nowrap">${teacher.name}</p>
          <h3>办公室：</h3>
          <p>${teacher.officeplace}</p>
          <h3>职业生涯：</h3>
          <p>${teacher.introduce}</p>
          <h3>邮箱：</h3>
          <p>${teacher.email}</p>
          <h3>电话号码：</h3>
          <p>${teacher.phone}</p>
        </div>
      </div>
    </div>


      <div class="card mb-3 " id="box5" >
        <div class="card-header">
          <i class="fa fa-table"></i>简历</div>
        <div class="card-body">
          <div class="col-12">
            <form action="/upresume" method="post" enctype="multipart/form-data" accept-charset="utf-8">
              <input type="file" name="upfile" />
              <input type="submit" value="上传我的简历" />
            </form>
          </div>
        </div>
      </div>

    <div class="card mb-3 " id="box6" >
      <div class="card-header">
        <i class="fa fa-table"></i>里程碑</div>
      <div class="card-body">
        <div class="col-12">
          <h3>三方协议</h3>
          <form action="/upsan" method="post" enctype="multipart/form-data" accept-charset="utf-8">
            <input type="file" name="upsan" />
            <input type="submit" value="上传三方协议" />
          </form>

          <form action="/upsummry" method="post" enctype="multipart/form-data" accept-charset="utf-8">
            <input type="file" name="upsummry" />
            <input type="submit" value="上传总结报告" />
          </form>
          <form action="/upzwjd" method="post" enctype="multipart/form-data" accept-charset="utf-8">
            <input type="file" name="upzwjd" />
            <input type="submit" value="上传自我鉴定" />
          </form>
          <button class="btn btn-primary btn-block"  onclick="intership()"  style="width: 10%">实习鉴定</button>
        </div>
      </div>
    </div>


    <%--<div class="card mb-3" id="box3">--%>
      <%--<div class="card-header">--%>
        <%--<i class="fa fa-table"></i>公司列表</div>--%>
      <%--<div class="card-body">--%>
        <%--<div class="table-responsive">--%>
          <%--<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">--%>
            <%--<thead>--%>
            <%--<tr>--%>
              <%--<th>公司</th>--%>
              <%--<th>公司主页</th>--%>
              <%--<th>地址</th>--%>
              <%--<th>电话</th>--%>
              <%--<th>邮箱</th>--%>
              <%--<th>企业指导老师</th>--%>
            <%--</tr>--%>
            <%--</thead>--%>
            <%--<tbody>--%>
            <%--<tr>--%>
              <%--<td>a</td>--%>
              <%--<td>b</td>--%>
              <%--<td>c</td>--%>
              <%--<td>d</td>--%>
              <%--<td>e</td>--%>
              <%--<td>f</td>--%>
            <%--</tr>--%>
            <%--</tbody>--%>
          <%--</table>--%>
        <%--</div>--%>
      <%--</div>--%>
    <%--</div>--%>


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


<script type="text/javascript">
  $(function () {
      $("#box").show();
      $("#box2").hide();
      $("#box3").hide();
      $("#box4").hide();
      $("#box5").hide();
      $("#box6").hide();
      $("#btn1").click(function(){

          $("#box").show();
          $("#box2").hide();
          $("#box3").hide();
          $("#box4").hide();
          $("#box5").hide();
          $("#box6").hide();
      });

      $("#btn2").click(function(){
          $("#box").hide();
          $("#box2").show();
          $("#box3").hide();
          $("#box4").hide();
          $("#box5").hide();
          $("#box6").hide();
      });

      $("#JL").click(function(){
          $("#box").hide();
          $("#box2").hide();
          $("#box3").hide();
          $("#box4").hide();
          $("#box5").show();
          $("#box6").hide();
      });


      $("#lcb").click(function(){
          $("#box").hide();
          $("#box2").hide();
          $("#box3").hide();
          $("#box4").hide();
          $("#box5").hide();
          $("#box6").show();
      });
      $("#btn3").click(function(){
          $("#box").hide();
          $("#box2").hide();
          $("#box4").hide();
          $("#box6").hide();
          $("#box5").hide();
      $.ajax({
          data:{},
          tpye:"post",
          url:'/allcompany',
          success:function(result){
              console.log(result);
              $("#companydiv").html(result);
          },
          error:function(message){
              loading.result(message);
              isSubmiting = false;
          }
        });
      });

      $("#zhaoren").click(function(){
          $("#box").hide();
          $("#box2").hide();
          $("#box3").hide();
          $("#box6").hide();
          $("#box5").hide();
          $.ajax({
              data:{},
              tpye:"post",
              url:'/recruitcompany',
              success:function(zhaorenmsg){
                  console.log(zhaorenmsg);
                  $("#zhaorendiv").html(zhaorenmsg);

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
            url:'/STinsertCO',
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
    function intership() {
        window.open("/jsp/intershipJD.jsp")
    }

</script>


</div>
</body>

</html>
