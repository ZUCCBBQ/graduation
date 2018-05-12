<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030"
         pageEncoding="utf-8" isELIgnored="false"%>

<div class="container-fluid" >
    <div class="card mb-3" id="box13">
    <div class="card-header">
        <i class="fa fa-table"></i>三方列表</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>专业班级</th>
                    <th>电话</th>
                    <th>公司</th>
                    <th>公司地址</th>
                    <th>职位</th>
                    <th>实习类型</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sanList}" var="stu">
                <tr>
                    <td>${stu.studentid}</td>
                    <td>${stu.studentname}</td>
                    <td>${stu.majorclass}</td>
                    <td>${stu.phone}</td>
                    <td>${stu.companyname}</td>
                    <td>${stu.companyplace}</td>
                    <td>${stu.position}</td>
                    <td>${stu.type}</td>
                    <td>${stu.begintime}</td>
                    <td>${stu.endtime}</td>

                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>