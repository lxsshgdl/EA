<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>我的出差申报</title>
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
                                        <th>编号</th>
                                        <th>用户名</th>
                                        <th>出差事项</th>
                                        <th>目的地</th>
                                        <th>出差类型</th>
                                        <th>同行人员</th>
                                        <th>出差原因</th>
                                        <th>出差开始时间</th>
                                        <th>出差结束时间</th>
                                        <th>通知文件</th>
                                        <th>费用</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.shenbaos}" var="shenbao">
                                        <tr>
                                            <td>${shenbao.id}</td>
                                            <td>${shenbao.username}</td>
                                            <td>${shenbao.pxcontent}</td>
                                            <td>${shenbao.address}</td>
                                            <td>${shenbao.type}</td>
                                            <td>${shenbao.fellowworkers}</td>
                                            <td>${shenbao.reason}</td>
                                            <td>${shenbao.begintime}</td>
                                            <td>${shenbao.endtime}</td>
                                            <td>${shenbao.file}</td>
                                            <td>${shenbao.feiyong}</td>
                                            <c:choose>
                                                <c:when test="${shenbao.audit==1}">
                                                    <td><a href="ShenbaoEditServlet?id=${shenbao.id}"><span
                                                            class="fa fa-pencil">编辑</span></a> <a
                                                            href="ShenbaoDelServlet?id=${shenbao.id}"><span
                                                            class="fa fa-trash-o">删除</span></a>
                                                    </td>
                                                </c:when>
                                                <c:when test="${shenbao.audit==2}">
                                                    <td>同意</td>
                                                </c:when>
                                                <c:when test="${shenbao.audit==3}">
                                                    <td>不同意</td>
                                                </c:when>
                                            </c:choose>
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