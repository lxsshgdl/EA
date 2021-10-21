<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>教工出差管理系统</title>
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
<body>
<c:forEach items="${sessionScope.users}" var="users">
    <c:set var="usertype" value="${users.usertype}"/>
</c:forEach>
<div class="sidebar-collapse navbar-side" style="height:100%;width:260px;float:left;background:black;">
    <ul class="nav" id="main-menu">
        <li class="active"><a href="PxlistServlet">首页</a></li>
        <c:choose>
            <c:when test="${usertype==4}">
                <li><a href="#">出差事项<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="pxShenbao.jsp">出差申请提交</a>
                        </li>
                        <li>
                            <a href="Baoxiao.jsp">出差报销提交</a>
                        </li>
                        <li>
                            <a href="SblistServlet">我的出差申请</a>
                        </li>
                        <li>
                            <a href="BxlistServlet">我的报销申请</a>
                        </li>
                    </ul>
                </li>
            </c:when>
            <c:when test="${usertype==2}">
                <li><a href="#">申报信息审批<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="LDBXlistServlet">报销审批</a>
                        </li>
                        <li>
                            <a href="LDSBlistServlet">出差审批</a>
                        </li>
                        <li>
                            <a href="search.jsp">报销审批结果查询</a>
                        </li>
                    </ul>
                </li>
                <li><a href="#">培训信息管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="pxfabu.jsp">新增培训信息</a>
                        </li>
                        <li>
                            <a href="PeixunlistServlet">培训信息处理</a>
                        </li>
                    </ul>
                </li>
            </c:when>
            <c:when test="${usertype==3}">
                <li><a href="pxfabu.jsp">发布培训信息</a></li>
                <li><a href="MPxlistServlet">我发布的培训信息</a></li>
            </c:when>
            <c:when test="${usertype==1}">
                <li><a href="#">用户管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="userlistServlet">用户列表</a>
                        </li>
                        <li>
                            <a href="useradd.jsp">新增用户</a>
                        </li>
                        <li>
                            <a href="shlistServlet">用户审核</a>
                        </li>
                    </ul>
                </li>
            </c:when>
        </c:choose>
    </ul>
    <ul id="myTab" class="nav nav-tabs">
        <li class="active" style="text-align: center;width: 33.3%"><a href="#notice" data-toggle="tab">通知</a></li>
        <li style="text-align: center;width: 33.3%"><a href="#function" data-toggle="tab">功能</a></li>
        <li style="text-align: center;width: 33.3%"><a href="#log" data-toggle="tab">开发日志</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="notice">
            <div class="list-group">
                <a href="#" class="list-group-item ">关于培训信息的说明</a>
                <a href="#" class="list-group-item">出差报销审批通知</a>
                <a href="#" class="list-group-item">教工出差管理系统使用说明</a>
                <a href="#" class="list-group-item">国庆节停止维护</a>
                <a href="#" class="list-group-item">出差申请名单</a>
            </div>
        </div>
        <div class="tab-pane fade" id="function">
            <div class="list-group list-group-horizontal">
                <a href="#" class="list-group-item" style="text-align: center;width: 34%">记事本</a>
                <a href="#" class="list-group-item" style="text-align: center;width: 33.8%">计算器</a>
                <a href="#" class="list-group-item" style="text-align: center;width: 34%">日历</a>
            </div>
        </div>
        <div class="tab-pane fade" id="log">
            <div class="list-group">
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">2020年10月22日</h4>
                    <p class="list-group-item-text">优化界面结构</p>
                </a>
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">2020年10月21日</h4>
                    <p class="list-group-item-text">添加左下角滑动窗口</p>
                </a>
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">2020年10月20日</h4>
                    <p class="list-group-item-text">编写后端连接数据库</p>
                </a>
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">2020年10月19日</h4>
                    <p class="list-group-item-text">设计前端界面</p>
                </a>
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">2020年10月18日</h4>
                    <p class="list-group-item-text">设计注册登录功能</p>
                </a>
            </div>
        </div>
    </div>
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators 小点点导航 从0开始-->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides 轮播组件内容 -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="img/1.jpg" alt="图片1">
            </div>
            <div class="item">
                <img src="img/2.jpg" alt="图片2">
            </div>
            <div class="item">
                <img src="img/3.jpg" alt="图片2">
            </div>
        </div>

        <!-- Controls 左右切换按钮-->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <style>
        /*限制幻灯片高度*/
        .carousel {
            height: 200px;
        }

        .carousel .item {
            height: 200px;
        }

        /*图片可跟随窗口缩放*/
        .carousel img {
            width: 100%;
            height: 100%;
        }

        .list-group-horizontal .list-group-item {
            display: inline-block;
        }

        .list-group-horizontal .list-group-item {
            margin-bottom: 0;
            margin-left: -4px;
            margin-right: 0;
        }

        .list-group-horizontal .list-group-item:first-child {
            border-top-right-radius: 0;
            /*border-bottom-left-radius: 4px;*/
        }

        .list-group-horizontal .list-group-item:last-child {
            /*border-top-right-radius: 4px;*/
            border-bottom-left-radius: 0;
        }
    </style>
</div>

<script src="assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- MORRIS CHART SCRIPTS -->
<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="assets/js/morris/morris.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="assets/js/custom.js"></script>
<!-- Essential javascripts for application to work-->
</body>
</html>