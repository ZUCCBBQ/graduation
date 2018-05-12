<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030"
         pageEncoding="utf-8" isELIgnored="false"%>

<div class="container-fluid" >
    <div class="card mb-3" id="box7">
    <div class="card-header">
        <i class="fa fa-table"></i>老师列表</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>工号</th>
                    <th>姓名</th>
                    <th>介绍</th>
                    <th>办公室</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>电话</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${teachertable}" var="tea">
                <tr>
                    <td>${tea.teacherid}</td>
                    <td>${tea.name}</td>
                    <td>${tea.introduce}</td>
                    <td>${tea.officeplace}</td>
                    <td>${tea.sex}</td>
                    <td>${tea.email}</td>
                    <td>${tea.phone}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>