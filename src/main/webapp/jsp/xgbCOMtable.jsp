<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030"
         pageEncoding="utf-8" isELIgnored="false"%>

<div class="container-fluid" >
    <div class="card mb-3" id="box1">
    <div class="card-header">
        <i class="fa fa-table"></i>公司列表</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>公司</th>
                    <th>公司主页</th>
                    <th>地址</th>
                    <th>电话</th>
                    <th>邮箱</th>
                    <th>企业指导老师</th>
                    <th>当前资格</th>
                    <th>更改资格</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${result}" var="company">
                <tr>
                    <td>${company.companyname}</td>
                    <td>${company.introduce}</td>
                    <td>${company.address}</td>
                    <td>${company.phone}</td>
                    <td>${company.email}</td>
                    <td>${company.managername}</td>
                    <td>${company.right}</td>
                    <td><button class="btn btn-primary btn-block" type="submit" onclick="f1('${company.companyid}')">更改</button></td>

                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>