<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>教工出差管理系统登录</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet"/>
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>

</head>
<body style="background: url(img/loginbackground.PNG) ; background-size:100% 100% ;background-attachment: fixed">
<div class="container">
    <div class="row text-center ">
        <div class="col-md-12">
            <br/><br/>
            <h2 style="color: white;font-family: Arial,serif">教工出差管理系统</h2>
            <h5 style="color: white">( Login yourself to get access )</h5>
            <br/>
        </div>
    </div>
    <div class="row ">
        <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <strong> 输入详情登录 </strong>
                </div>
                <div class="panel-body">
                    <form role="form" action="LoginServlet" method="post">
                        <br/>
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input type="text" class="form-control" id="username" name="username"
                                   placeholder="你的用户名"/>
                        </div>
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="你的密码 "/>
                        </div>
                        <input type="submit" class="btn btn-block" value="登录"
                               style="background-color: #2EA7EB;color: white">
                        <hr/>
                        还没注册？<a href="registeration.jsp">现在注册</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="assets/js/custom.js"></script>
<!-- 线条背景动画 -->
<script src="assets/js/line.js" color="255,255,255" opacity="1" count="100" zindex=-2></script>

</body>
</html>
