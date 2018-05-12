<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030"
         pageEncoding="utf-8" isELIgnored="false"%>

<div class="container-fluid" >
    <div class="card mb-3" id="box2">
    <div class="card-header">
        <i class="fa fa-table"></i>学生列表</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>专业班级</th>
                    <th>简历下载</th>
                    <th>录用</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${stulist}" var="stu">

                <tr>
                    <td>${stu.studentid}</td>
                    <td>${stu.name}</td>
                    <td>${stu.sex}</td>
                    <td>${stu.majorclass}</td>

                    <td><button class="btn btn-primary btn-block" type="submit" onclick="f1('${stu.studentid}')">下载</button></td>
                    <td><button class="btn btn-primary btn-block" type="submit" onclick="f2('${stu.studentid}')">录用</button></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>