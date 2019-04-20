<%--
  Created by IntelliJ IDEA.
  User: Handsome
  Date: 2018/11/12
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="include/top.jsp" %>
<html>
<head>
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" />

    <title>Title</title>
    <style>
        .header {
            padding: 22px 0px;
            height: 88px;
            width: 1190px;
            margin: auto;
        }

        a {
            text-decoration: none;
        }


        .content {
            position: relative;
            width: 100%;
            margin-bottom: 40px;
        }

        .login-banner-wrap img {
            display: block;
            margin: auto;
            position: relative;
            right: 600px;
        }

        .content .form {
            display: none;
            position: absolute;
            top: 91px;
            right: 60px;
            background: #fff;
        }

        .form-inner {
            padding: 25px 26px 20px;
            width: 350px;
            height: 404px;
        }

        .static-form {
            display: block;
            position: relative;
        }

        .login-title {
            height: 18px;
            line-height: 18px;
            font-size: 16px;
            color: #3c3c3c;
            margin-top: 19px;
            padding-bottom: 8px;
            font-weight: 700;
        }

        .field {
            margin-top: 25px;
            position: relative;
        }

        div.field {
            border: 1px solid #CBCBCB;
            margin: 20px 0px;
        }

        div.field span.loginInputIcon {
            margin: 0px;
            background-color: #CBCBCB;
            width: 40px;
            height: 40px;
            display: inline-block;
        }

        span.loginInputIcon span.glyphicon {
            font-size: 22px;
            position: relative;
            left: 9px;
            top: 9px;
            color: #606060;
        }

        div.field input {
            display: inline-block;
            border: 0px solid transparent;
            width: 244px;
            height: 30px;
            position: relative;
            left: 6px;
            top: 6px;
        }

        button.redButton {
            color: white;
            background-color: #FF0036;
            font-size: 16px;
            font-weight: 700;
            height: 42px;
            line-height: 42px;
            vertical-align: middle;
            width: 300px;
            border-radius: 3px;
            border: 0;
        }

        button.redButton:hover {
            background-color: rgba(255, 0, 54, .8);
        }
    </style>
</head>
<body>
<div class="content">
    <div class="login-banner-wrap" style="width: 100%; background-color: rgb(223, 226, 231);" title="">
        <div class="inner">
            <img src="img/site/loginpic.jpg">
        </div>
    </div>

    <div class="form" style="display: block; right: 176.5px;">
        <div class="form-inner">
            <div class="static-form">
                <div class="loginErrorMessageDiv" style="display: none;">
                    <div class="alert alert-danger" >
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                        <span class="errorMessage"></span>
                    </div>
                </div>
                <div class="login-title">新用户注册</div>
                <form action="registersuccess" class="loginForm" method="post" onsubmit="return check()">
                    <div class="field">
                        <span class="loginInputIcon">
					        <span class=" glyphicon glyphicon-user"></span>
				        </span>
                        <input id="name" name="name" placeholder="手机/会员名/邮箱" type="text" onblur="checkname()">
                        <span id="name_span"></span>
                    </div>
                    <div class="field">
                        <span class="loginInputIcon ">
                            <span class=" glyphicon glyphicon-lock"></span>
                        </span>
                        <input id="password" name="password" type="password" placeholder="密码" type="text" onblur="checkpassword()">
                        <span id="password_span"></span>
                    </div>
                    <div class="field">
                        <span class="loginInputIcon ">
                            <span class=" glyphicon glyphicon-lock"></span>
                        </span>
                        <input id="password1" name="password1" type="password" placeholder="确认密码" type="text" onblur="checkpassword1()">
                        <span id="password1_span"></span>
                    </div>

                    <div style="margin-top:10px">
                        <button class="redButton" type="submit">注 册</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function checkpassword() {
        var f1=false;
        var password = document.getElementById("password").value;

        if(password==""){
            document.getElementById("password_span").innerHTML="密码不能为空";
        }
        else if (password.length<6||password.length>15) {
            document.getElementById("password_span").innerHTML="密码的长度为6-15位";
        }
        else {
            document.getElementById("password_span").innerHTML="";

            f1=true;
        }

        return f1;
    }
    function checkpassword1() {
        var f2=false;
        var password = document.getElementById("password").value;
        var password1 = document.getElementById("password1").value;

        if (password1=="") {
            document.getElementById("password1_span").innerHTML="请输入确认密码";
        }
        else if (password!=password1) {
            document.getElementById("password1_span").innerHTML="密码输入不一致，请重新输入";
        }
        else {
            document.getElementById("password1_span").innerHTML="";

            f2=true;
        }

        return f2;
    }
    function checkname(){
        var f=false;
        //获取用户输入的用户名
        var name = document.getElementById("name").value;
        //去除字符串两端空格
        name=name.trim();
        //判断是否为空
        if(name==""){
            document.getElementById("name_span").innerHTML="用户名不能为空";
        }else if(name.length<3||name.length>12){
            document.getElementById("name_span").innerHTML="用户名的长度为3-12位";
        }
        else{
            document.getElementById("name_span").innerHTML="";
            //校验用户名是否存在
            //使用ajax异步校验用户名
            $.ajax({
                url:"checkname",
                type:"post",
                data:{"name":name},//json数据格式的用户名从jsp传递给controller
                dataType:"json",
                async:false,//让ajax执行代码顺序同步
                success:function(data){
                    if(data.msg=="false"){
                        document.getElementById("name_span").innerHTML="用户名已存在";
                    }else{
                        document.getElementById("name_span").innerHTML="用户名可用";
                        f=true;
                    }
                }
            });

        }
        return f;
    }
    function check() {
        if (checkname()&checkpassword()&checkpassword1()){
            return true;
        }
        else {
            return false;
        }
    }

</script>
</body>
</html>
