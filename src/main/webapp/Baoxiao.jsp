<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>出差报销提交</title>
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
                        <h2>出差报销</h2>
                        <br/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1" >
                        <div class="panel panel-default">
                            <div class="panel-body" >
                                <form action="BaoxiaoServlet" method="POST">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-group"></i></span>
                                        <input type="text" class="form-control" name="fellowworkers" id="fellowworkers"
                                               placeholder="同行人员"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                        <input type="text" class="form-control" name="address" id="address"
                                               placeholder="目的地"/>
                                    </div>

                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                        <input type="text" class="form-control" name="feiyong" id="feiyong"
                                               placeholder="费用"/>
                                    </div>

                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-edit"></i></span>
                                        <input type="text" class="form-control" name="summary" id="summary"
                                               placeholder="总结"/>
                                    </div>

                                    <input type="submit" value="完成提交" class="btn btn-block"
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