<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030"
         pageEncoding="utf-8" isELIgnored="false"%>

<div class="container-fluid" >
    <div class="card mb-3" id="box10">
    <div class="card-header">
        <i class="fa fa-table"></i>里程碑</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>三方协议下载</th>
                    <th>总结报告下载</th>
                    <th>自我鉴定下载</th>
                    <th>三方协议通过</th>
                    <th>总结报告通过</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${stidlist}" var="stulist">
                <tr>
                    <td>${stulist.studentid}</td>
                    <td>${stulist.name}</td>
                    <td><button class="btn btn-primary btn-block" type="submit" onclick="f4('${stulist.studentid}')">下载</button></td>
                    <td><button class="btn btn-primary btn-block" type="submit" onclick="f5('${stulist.studentid}')">下载</button></td>
                    <td><button class="btn btn-primary btn-block" type="submit" onclick="f6('${stulist.studentid}')">下载</button></td>
                    <td><button class="btn btn-primary btn-block" type="submit" onclick="f7('${stulist.studentid}')">通过</button></td>
                    <td><button class="btn btn-primary btn-block" type="submit" onclick="f8('${stulist.studentid}')">通过</button></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>