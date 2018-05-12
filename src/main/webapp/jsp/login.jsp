<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030"
pageEncoding="gb2312" isELIgnored="false"%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>�����Ժ��ҵʵϰ����</title>
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
      <div class="card-header">��¼</div>
      <div class="card-body">

        <form id="loginForm" method="post" action="/api/login">
          <div class="form-group">
            <label for="exampleInputEmail1">�û���</label>
            <input class="form-control" id="exampleInputEmail1" name="name_users" type="text" aria-describedby="emailHelp" >
          </div>

          <div class="form-group">
            <label for="exampleInputPassword1">����</label>
            <input class="form-control" id="exampleInputPassword1" name="password_users" type="password" >
          </div>

          <div class="form-group">
            <label for="exampleInputPassword1">�û�����</label>
            <select id="domain" name="role_users" class="form-control">
              <option value="student">ѧ��</option>
              <option value="teacher">��ʦ</option>
              <option value="company">��ҵָ����ʦ</option>
              <option value="jxb">��ѧ��</option>
              <option value="xgb">ѧ����</option>
            </select>
          </div>


          <div class="form-group">
            <div class="form-check">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="remember"> ��ס����</label>
            </div>
          </div>
          <button class="btn btn-primary btn-block" type="submit">��¼</button>
        </form>
        <%--<div class="text-center">--%>
          <%--<!-- <a class="d-block small mt-3" hrregister.jsphtml">�������û�</a> -->--%>
          <%--<a class="d-block small" href="/jsp/forgot-password.jsp">��������</a>--%>
        <%--</div>--%>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <!--<script src="vendor/jquery/jquery.min.js"></script>-->
  <!--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>-->
  <!--&lt;!&ndash; Core plugin JavaScript&ndash;&gt;-->
  <!--<script src="vendor/jquery-easing/jquery.easing.min.js"></script>-->
  <%--<script type="text/javascript" src="../js/global.js"></script>--%>
  <!--<script type="text/javascript" src="../js/md5.js"></script>-->
  <%--<script src="../js/Login.js"></script>--%>
  <script>
      window.onload = function(){
          var oForm = document.getElementById('loginForm');
          var oUser = document.getElementById('name_users');
          var oPswd = document.getElementById('password_users');
          var oRemember = document.getElementById('remember');
          //ҳ���ʼ��ʱ������ʺ�����cookie���������
          if(getCookie('name_users') && getCookie('password_users')){
              oUser.value = getCookie('name_users');
              oPswd.value = getCookie('password_users');
              oRemember.checked = true;
          }
          //��ѡ��ѡ״̬�����ı�ʱ�����δ��ѡ�����cookie
          oRemember.onchange = function(){
              if(!this.checked){
                  delCookie('name_users');
                  delCookie('password_users');
              }
          };
          //���ύ�¼�����ʱ�������ѡ���ǹ�ѡ״̬�򱣴�cookie
          oForm.onsubmit = function(){
              if(remember.checked){
                  setCookie('name_users',oUser.value,7); //�����ʺŵ�cookie����Ч��7��
                  setCookie('password_users',oPswd.value,7); //�������뵽cookie����Ч��7��
              }
          };
      };
      //����cookie
      function setCookie(name,value,day){
          var date = new Date();
          date.setDate(date.getDate() + day);
          document.cookie = name + '=' + value + ';expires='+ date;
      };
      //��ȡcookie
      function getCookie(name){
          var reg = RegExp(name+'=([^;]+)');
          var arr = document.cookie.match(reg);
          if(arr){
              return arr[1];
          }else{
              return '';
          }
      };
      //ɾ��cookie
      function delCookie(name){
          setCookie(name,null,-1);
      };
  </script>


</body>

</html>
