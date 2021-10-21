<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>报销审批页面</title>
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
                                        <th>同行人员</th>
                                        <th>目的地</th>
                                        <th>总结</th>
                                        <th>费用</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.baoxiaos}" var="baoxiao">
                                        <tr>
                                            <td>${baoxiao.id}</td>
                                            <td>${baoxiao.username}</td>
                                            <td>${baoxiao.fellowworkers}</td>
                                            <td>${baoxiao.address}</td>
                                            <td>${baoxiao.summary}</td>
                                            <td>${baoxiao.feiyong}</td>
                                            <td><a href="BaoxiaoSPServlet?audit=2&id=${baoxiao.id}"><span
                                                    class="fa fa-pencil">同意</span></a> <a
                                                    href="BaoxiaoSPServlet?audit=3&id=${baoxiao.id}"><span
                                                    class="fa fa-trash-o">不同意</span></a>
                                                <a href="BaoxiaoSPServlet?audit=4&id=${baoxiao.id}"><span
                                                        class="fa fa-trash-o">修改</span></a></td>
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