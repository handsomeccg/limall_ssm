<%--
  Created by IntelliJ IDEA.
  User: Handsome
  Date: 2018/11/22
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" />
<html>
<style>
    nav{
        font-size: 12px;
        font-family: Arial;
    }
    nav.a{
        color:#999;
    }
    nav.top{
        background-color: #f2f2f2;
        padding-top: 5px;
        padding-bottom: 5px;
        border-bottom:1px solid  #e7e7e7;
    }
    nav.top span,nav.top a{

        margin: 0px 10px 0px 10px;
    }
    nav.top a:hover{
        color: #C40000;
        text-decoration: none;
    }

    nav.a:hover{
        text-decoration:none;
        color:#C40000;
    }
</style>
<body>
<nav class="top">
    <span class="glyphicon glyphicon-home redColor">喵，欢迎来到狸猫</span>
    <a href="login" id="login_a">请登录</a>
    <span id="login_span"></span>
    <a href="register" id="register_a">免费注册</a>
    <span class="pull-right">
    <a href="home">狸猫网首页</a>
	<a href="bought">我的订单</a>
	<a href="cart"><span class="glyphicon glyphicon-shopping-cart redColor"></span>购物车<strong>0</strong>件</a>
	</span>
</nav>



<script>
    $(function checklogin() {
        if("${sessionScope.user}"){
            document.getElementById("login_a").innerText="";
            document.getElementById("login_span").innerText="亲爱的${sessionScope.user.name},你好";
            document.getElementById("register_a").innerText="";
        }

    })
</script>
</body>
</html>
