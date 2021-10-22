<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>培训信息修改页面</title>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.users}">
        <%@include file="top.jsp" %>
        <div class="nav" style="background:black;">
            <%@include file="left.jsp" %>
            <c:set var="peixun" value="${requestScope.peixun}"/>
            <div id="page-wrapper" style=" background: url(img/background.PNG); background-size:100% 100% ;background-attachment: fixed">
                <div class="row text-center ">
                    <div class="col-md-12">
                        <br/><br/>
                        <h2> 培训信息修改</h2>

                        <br/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <form action="PxsaveServlet" method="POST">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-tag"></i></span>
                                        <input type="text" value="${peixun.title}" class="form-control" name="title"
                                               id="title" placeholder="标题"/>
                                    </div>

                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-file-text-o"></i></span>
                                        <input type="text" value="${peixun.title}" class="form-control" name="content"
                                               id="content" placeholder="正文"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-copy"></i></span>
                                        <input type="file" value="${peixun.file}" class="form-control" name="file"
                                               id="file"/>
                                    </div>
                                    <input type="hidden" value="${peixun.id}" name="id">
                                    <input type="submit" value="完成修改" class="btn btn-block"
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