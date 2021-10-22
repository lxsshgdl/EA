<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%--在页面正常显示中文--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入标签库的定义--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>出差申请修改页面</title>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.users}">
        <%--        sessionScope隐含对象，用来取得指定范围内的属性值，而不能取得其他相关信息。not empty用来判空--%>
        <%@include file="top.jsp" %>
        <div class="nav" style="background:black;">
            <%@include file="left.jsp" %>
            <c:set var="shenbao" value="${requestScope.shenbao}"/>
            <c:choose>
                <c:when test="${shenbao.type==1}">
                    <c:set var="select1" value="${selected='selected'}"/>
                </c:when>
                <c:when test="${shenbao.type==2}">
                    <c:set var="select2" value="${selected='selected'}"/>
                </c:when>
                <c:when test="${shenbao.type==3}">
                    <c:set var="select3" value="${selected='selected'}"/>
                </c:when>
                <c:when test="${shenbao.type==4}">
                    <c:set var="select4" value="${selected='selected'}"/>
                </c:when>
            </c:choose>
            <div id="page-wrapper"
                 style=" background: url(img/background.PNG); background-size:100% 100% ;background-attachment: fixed">
                <div class="row text-center  ">
                    <div class="col-md-12">
                        <br/><br/>
                        <h2>出差申请修改</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <form action="ShenbaosaveServlet" method="POST">

                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-file-text-o"></i></span>
                                        <input type="text" value="${shenbao.pxcontent}" class="form-control"
                                               name="pxcontent" id="pxconent" placeholder="出差事项"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                        <input type="text" value="${shenbao.address}" class="form-control"
                                               name="address" id="address" placeholder="目的地"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-circle-o-notch"></i></span>
                                        <select class="form-control" name="type" id="type">
                                            <option>出差类型</option>
                                            <option value="1" ${select1}>培训</option>
                                            <option value="2" ${select2}>考察</option>
                                            <option value="3" ${select3}>开会</option>
                                            <option value="4" ${select4}>参赛</option>
                                        </select>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-group"></i></span>
                                        <input type="text" value="${shenbao.fellowworkers}" class="form-control"
                                               name="fellowworkers" id="fellowworkers" placeholder="同行人员"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-comment-o"></i></span>
                                        <input type="text" value="${shenbao.reason}" class="form-control" name="reason"
                                               id="reason" placeholder="出差原因"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="date" value="${shenbao.begintime}" class="form-control"
                                               name="begintime" id="begintime"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="date" value="${shenbao.endtime}" class="form-control"
                                               name="endtime" id="endtime"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-file-o"></i></span>
                                        <input type="file" value="${shenbao.file}" class="form-control" name="file"
                                               id="file"/>
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                        <input type="text" value="${shenbao.feiyong}"
                                               class="form-control"
                                               name="feiyong" id="feiyong"
                                               placeholder="预计费用"/>
                                    </div>

                                    <input type="hidden" value="${shenbao.id}">
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