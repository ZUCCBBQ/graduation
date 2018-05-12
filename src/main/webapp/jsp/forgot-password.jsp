<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030"
         pageEncoding="gb2312" isELIgnored="false"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>计算分院毕业实习管理</title>
  <!-- Bootstrap core CSS-->
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="../css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark1">
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">重置密码</div>
      <div class="card-body">
        <div class="text-center mt-4 mb-5">
          <h4></h4>

        </div>
        <form action="/changepwd">
          <div class="form-group">
            <input class="form-control" id="exampleInputEmail3" placeholder="账号" type="text" aria-describedby="emailHelp">
          </div>

          <div class="form-group">
            <input class="form-control" id="exampleInputEmail1" placeholder="原密码" type="password" aria-describedby="emailHelp">
          </div>
          <div class="form-group">
            <input class="form-control" id="exampleInputEmail2" placeholder="新密码"type="text" aria-describedby="emailHelp">
          </div>
          <a class="btn btn-primary btn-block" href="login.login.jsp">提交</a>
        </form>
        <div class="text-center">
          <!-- <a class="d-block small mt-3" href="register.html">Register an Account</a> -->
          <a class="d-block small" href="/jsp/login.jsp">登录</a>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>
