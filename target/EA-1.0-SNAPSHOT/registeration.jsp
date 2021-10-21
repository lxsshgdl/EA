<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>教工出差管理系统：注册</title>
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
    <div class="row text-center  ">
        <div class="col-md-12">
            <br/><br/>
            <h2 style="color: white;font-family: Arial,serif"> 教工出差管理系统：注册</h2>

            <h5 style="color: white">( Register yourself to get access )</h5>
            <br/>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <strong> 新用户？完成注册 </strong>
                </div>
                <div class="panel-body">
                    <form action="RegistServlet" method="POST">
                        <br/>

                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input type="text" class="form-control" name="username" id="username" placeholder="用户名"/>
                        </div>
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input type="password" class="form-control" name="password" id="password"
                                   placeholder="输入密码"/>
                        </div>
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <input type="email" class="form-control" name="email" id="email" placeholder="你的邮箱"/>
                        </div>
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="fa fa-circle-o-notch"></i></span>
                            <select class="form-control" name="usertype" id="usertype">
                                <option value="2">领导</option>
                                <option value="3">秘书</option>
                                <option value="4">教师</option>
                            </select>
                        </div>
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                            <input type="text" class="form-control" name="jobtitle" id="jobtitle" placeholder="你的职称"/>
                        </div>

                        <input type="submit" value="完成注册" class="btn btn-block"
                               style="background-color: #00CE6F;color: white">
                        <hr/>
                        已经注册过了? <a href="login.jsp">这里登录</a>
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
