<%--
  Created by IntelliJ IDEA.
  User: 高硕
  Date: 2021/10/19
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>培训信息</title>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.users}">
        <%@include file="top.jsp" %>
        <div class="nav" style="background:black;">
            <%@include file="left.jsp" %>
            <div id="page-wrapper"
                 style=" background: url(img/background.PNG); background-size:100% 100% ;background-attachment: fixed">
                <div class="row text-center ">
                    <div class="col-md-12">
                        <br/><br/>
                        <h2>培训信息处理</h2>
                        <br/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="tile">
                            <div class="tile-body">
                                <table class="table table-hover table-bordered" id="userTable">
                                    <thead>
                                    <tr>
                                        <th>编号</th>
                                        <th>标题</th>
                                        <th>正文</th>
                                        <th>发布人</th>
                                        <th>通知文件</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.peixuns}" var="peixun">
                                        <tr>
                                            <td>${peixun.id}</td>
                                            <td>${peixun.title}</td>
                                            <td>${peixun.content}</td>
                                            <td>${peixun.username}</td>
                                            <td>${peixun.file}</td>
                                            <td><a href="PxEditServlet?id=${peixun.id}"><span
                                                    class="fa fa-pencil">编辑</span></a> <a
                                                    href="PxDelServlet?id=${peixun.id}"><span
                                                    class="fa fa-trash-o">删除</span></a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </c:when>
    <c:otherwise>
        <%response.sendRedirect("login.jsp");%>
        <%--        实现页面跳转重定向--%>
    </c:otherwise>
</c:choose>
</body>
</html>
