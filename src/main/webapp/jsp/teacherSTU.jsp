<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030"
         pageEncoding="utf-8" isELIgnored="false"%>

<div class="container-fluid" >
    <div class="card mb-3" id="box2">
    <div class="card-header">
        <i class="fa fa-table"></i>我指导的学生</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>班级</th>
                    <th>所在公司</th>
                    <th>公司地址</th>
                    <th>企业指导老师</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${teagetstu}" var="stulist">
                <tr>
                    <td>${stulist.studentid}</td>
                    <td>${stulist.studentname}</td>
                    <td>${stulist.major}</td>
                    <td>${stulist.companyname}</td>
                    <td>${stulist.companyplace}</td>
                    <td>${stulist.managername}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>