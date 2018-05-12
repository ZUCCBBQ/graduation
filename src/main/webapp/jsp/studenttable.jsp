<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030"
         pageEncoding="utf-8" isELIgnored="false"%>

<div class="container-fluid" >
    <div class="card mb-3" id="box4">
    <div class="card-header">
        <i class="fa fa-table"></i>学生列表</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>班级</th>
                    <th>性别</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${studenttable}" var="stu">
                <tr>
                    <td>${stu.studentid}</td>
                    <td>${stu.name}</td>
                    <td>${stu.majorclass}</td>
                    <td>${stu.sex}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>