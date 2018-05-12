<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030"
         pageEncoding="utf-8" isELIgnored="false"%>

<div class="container-fluid" >
    <div class="card mb-3" id="box11">
    <div class="card-header">
        <i class="fa fa-table"></i>学生成绩列表</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>校内指导老师</th>
                    <th>所在企业</th>
                    <th>企业三方确认</th>
                    <th>老师三方确认</th>
                    <th>企业总结确认</th>
                    <th>教师总结确认</th>
                    <th>得分</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${studentrecordList}" var="student">
                <tr>
                    <td>${student.studentid}</td>
                    <td>${student.studentname}</td>
                    <td>${student.teacher}</td>
                    <td>${student.company}</td>
                    <td>${student.sancompany}</td>
                    <td>${student.santeacher}</td>
                    <td>${student.zjcompany}</td>
                    <td>${student.zjteacher}</td>
                    <td>${student.record}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            <button class="btn btn-primary btn-block"  onclick="record()"  style="width: 10%">导出数据</button>
        </div>
    </div>
</div>
</div>