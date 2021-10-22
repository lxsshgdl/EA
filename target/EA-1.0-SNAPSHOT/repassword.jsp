<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改密码页面</title>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.users}">
        <%@include file="top.jsp" %>
        <div class="nav" style="background:black;">
            <%@include file="left.jsp" %>
            <div id="page-wrapper"
                 style=" background: url(img/background.PNG); background-size:100% 100% ;background-attachment: fixed">
                <div class="row text-center  " style="margin-left:50px;">
                    <div class="col-md-12">
                        <br/><br/>
                        <h2>修改密码</h2>
                        <br/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <form action="RepwServlet" method="POST">

                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input type="password" class="form-control" name="password" id="password"
                                               placeholder="当前密码"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input type="password" class="form-control" name="npassword" id="npassword"
                                               placeholder="新密码"/>
                                    </div>
                                    <input type="submit" value="修改密码" class="btn btn-block"
                                           style="background-color: #00CE6F;color: white">
                                </form>
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