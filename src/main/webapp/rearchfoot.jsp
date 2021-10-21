<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>查询结果页面</title>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.users}">
        <%@include file="top.jsp" %>
        <div class="nav" style="background:black;">
            <%@include file="left.jsp" %>
            <div id="page-wrapper"
                 style=" background: url(img/background.PNG); background-size:100% 100% ;background-attachment: fixed">
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
                                        <th>审批结果</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.baoxiaos}" var="baoxiao">
                                        <%--                                        获取数据循环判断--%>
                                        <tr>
                                            <td>${baoxiao.id}</td>
                                            <td>${baoxiao.username}</td>
                                            <td>${baoxiao.fellowworkers}</td>
                                            <td>${baoxiao.address}</td>
                                            <td>${baoxiao.summary}</td>
                                            <td>${baoxiao.feiyong}</td>
                                            <c:choose>
                                                <%--                                                根据不同条件执行不同语句--%>
                                                <c:when test="${baoxiao.audit==1}">
                                                    <td>未审批</td>
                                                </c:when>
                                                <c:when test="${baoxiao.audit==2}">
                                                    <td>同意</td>
                                                </c:when>
                                                <c:when test="${baoxiao.audit==3}">
                                                    <td>不同意</td>
                                                </c:when>
                                                <c:when test="${baoxiao.audit==4}">
                                                    <td>修改</td>
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