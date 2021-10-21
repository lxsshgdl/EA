<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户修改页面</title>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.users}">
        <%@include file="top.jsp" %>
        <div class="nav" style="background:black;">
            <%@include file="left.jsp" %>
                <%--            包含其它文件--%>
            <c:set var="user" value="${requestScope.user}"/>
                <%--            set用于保存数据，requestScope隐含对象，用来取得指定范围内的属性值，而不能取得其他相关信息。--%>
            <c:choose>
                <%--                本身只当做<c:when>和<c:otherwise>的父标签--%>
                <c:when test="${user.usertype==1}">
                    <%--                    <c:choose>的子标签，用来判断条件是否成立--%>
                    <c:set var="select1" value="${selected='selected'}"/>
                </c:when>
                <c:when test="${user.usertype==2}">
                    <c:set var="select2" value="${selected='selected'}"/>
                </c:when>
                <c:when test="${user.usertype==3}">
                    <c:set var="select3" value="${selected='selected'}"/>
                </c:when>
                <c:when test="${user.usertype==4}">
                    <c:set var="select4" value="${selected='selected'}"/>
                </c:when>
            </c:choose>
            <div id="page-wrapper"
                 style=" background: url(img/background.PNG); background-size:100% 100% ;background-attachment: fixed">
                <div class="row text-center  ">
                    <div class="col-md-12">
                        <br/><br/>
                        <h2>管理员修改用户</h2>
                    </div>
                </div>
                <div class="row">

                    <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                            </div>
                            <div class="panel-body">
                                <form action="UsersaveServlet" method="POST">
                                    <br/>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <label for="username"></label><input type="text" value="${user.username}"
                                                                             class="form-control" name="username"
                                                                             id="username" placeholder="用户名"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <label for="password"></label><input type="password" value="${user.password}"
                                                                             class="form-control"
                                                                             name="password" id="password"
                                                                             placeholder="输入密码"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i
                                                class="glyphicon glyphicon-envelope"></i></span>
                                        <label for="email"></label><input type="email" value="${user.email}"
                                                                          class="form-control" name="email"
                                                                          id="email" placeholder="你的邮箱"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-circle-o-notch"></i></span>
                                        <label for="usertype"></label><select class="form-control" name="usertype"
                                                                              id="usertype">
                                        <option value="1" ${select1}>管理员</option>
                                        <option value="2" ${select2}>领导</option>
                                        <option value="3" ${select3}>秘书</option>
                                        <option value="4" ${select4}>教师</option>
                                    </select>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                                        <label for="jobtitle"></label><input type="text" value="${user.jobtitle}"
                                                                             class="form-control" name="jobtitle"
                                                                             id="jobtitle" placeholder="你的职称"/>
                                    </div>
                                    <input type="hidden" value="${user.id}" name="id" id="id">


                                    <input type="submit" value="修改用户" class="btn btn-block"
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