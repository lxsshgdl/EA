<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>新增用户</title>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.users}">
        <%@include file="top.jsp" %>
        <div class="nav" style="background:black;">
            <%@include file="left.jsp" %>
            <div id="page-wrapper" style=" background: url(img/background.PNG); background-size:100% 100% ;background-attachment: fixed">
                <div class="row text-center">
                    <div class="col-md-12">
                        <br/><br/>
                        <h2>管理员新增用户</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                            </div>
                            <div class="panel-body">
                                <form action="UseraddServlet" method="POST">
                                    <br/>

                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input type="text" class="form-control" name="username" id="username"
                                               placeholder="用户名"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input type="password" class="form-control" name="password" id="password"
                                               placeholder="输入密码"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i
                                                class="glyphicon glyphicon-envelope"></i></span>
                                        <input type="email" class="form-control" name="email" id="email"
                                               placeholder="你的邮箱"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-circle-o-notch"></i></span>
                                        <select class="form-control" name="usertype" id="usertype">
                                            <option>使用对象</option>
                                            <option value="1">管理员</option>
                                            <option value="2">领导</option>
                                            <option value="3">秘书</option>
                                            <option value="4">教师</option>
                                        </select>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                                        <input type="text" class="form-control" name="jobtitle" id="jobtitle"
                                               placeholder="你的职称"/>
                                    </div>
                                    <input type="submit" value="新增用户" class="btn btn-block"
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