<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户审核页面</title>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.users}">
        <%@include file="top.jsp" %>
        <div class="nav" style="background:black;">
            <%@include file="left.jsp" %>
            <div id="page-wrapper" style=" background: url(img/background.PNG); background-size:100% 100% ;background-attachment: fixed">
                <div class="row">
                    <div class="col-md-12">
                        <div class="tile">
                            <div class="tile-body">
                                <table class="table table-hover table-bordered" id="userTable">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>用户名</th>
                                        <th>职称</th>
                                        <th>邮箱</th>
                                        <th>注册日期</th>
                                        <th>最后登录日期</th>
                                        <th>用户类型</th>
                                        <th>是否活跃</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.users}" var="user">

                                        <tr>

                                            <td>${user.id}</td>
                                            <td>${user.username}</td>
                                            <td>${user.jobtitle}</td>
                                            <td>${user.email}</td>
                                            <td>${user.date_joined}</td>
                                            <td>${user.last_login}</td>
                                            <td>${user.usertype}</td>
                                            <td>${user.is_active}</td>
                                            <td><a href="usershServlet?id=${user.id}"><span
                                                    class="fa fa-pencil">确认审核</span></a></td>
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
    </c:otherwise>
</c:choose>
</body>
</html>