<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030"
         pageEncoding="utf-8" isELIgnored="false"%>

<div class="container-fluid" >
    <div class="card mb-3" id="box7">
    <div class="card-header">
        <i class="fa fa-table"></i>落实工作学生列表</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>专业班级</th>
                    <th>校内指导老师</th>
                    <th>所在企业</th>
                    <th>企业联系方式</th>
                    <th>企业指导老师</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${workstudents}" var="student">
                <tr>
                    <td>${student.studentid}</td>
                    <td>${student.studentname}</td>
                    <td>${student.sex}</td>
                    <td>${student.majorclass}</td>
                    <td>${student.teacher}</td>
                    <td>${student.companyname}</td>
                    <td>${student.comanyphone}</td>
                    <td>${student.managername}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            <button class="btn btn-primary btn-block"  onclick="workstu()"  style="width: 10%">导出数据</button>
        </div>
    </div>
</div>
</div>