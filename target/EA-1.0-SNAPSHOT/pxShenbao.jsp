<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>教师出差申请页面</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet"/>
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet"/>
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>

</head>
<body class="app sidebar-mini rtl">
<c:choose>
    <c:when test="${not empty sessionScope.users}">
        <%@include file="top.jsp" %>
        <div class="nav" style="background:black;">
            <%@include file="left.jsp" %>
            <div id="page-wrapper" style=" background: url(img/background.PNG); background-size:100% 100% ;background-attachment: fixed">
                <div class="row text-center">
                    <div class="col-md-12">
                        <br/><br/>
                        <h2>出差申请</h2>
                        <br/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <form action="ShenbaoServlet" method="POST">

                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-file-text-o"></i></span>
                                        <input type="text" class="form-control" name="pxconent" id="pxconent"
                                               placeholder="出差事项"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                        <input type="text" class="form-control" name="address" id="address"
                                               placeholder="目的地"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-circle-o-notch"></i></span>
                                        <select class="form-control" name="type" id="type">
                                            <option>出差类型</option>
                                            <option value="1">培训</option>
                                            <option value="2">考察</option>
                                            <option value="3">开会</option>
                                            <option value="4">参赛</option>
                                        </select>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-group"></i></span>
                                        <input type="text" class="form-control" name="fellowworkers" id="fellowworkers"
                                               placeholder="同行人员"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-comment-o"></i></span>
                                        <input type="text" class="form-control" name="reason" id="reason"
                                               placeholder="出差原因"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="date" class="form-control" name="begintime" id="begintime"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="date" class="form-control" name="endtime" id="endtime"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-file-o"></i></span>
                                        <input type="file" class="form-control" name="file" id="file"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                        <input type="text" class="form-control" name="feiyong" id="feiyong"
                                               placeholder="预计费用"/>
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
        <%@include file="/footer.jsp" %>
    </c:when>
    <c:otherwise>
        <%response.sendRedirect("/zzy/login.jsp"); %>
    </c:otherwise>
</c:choose>

</body>
</html>