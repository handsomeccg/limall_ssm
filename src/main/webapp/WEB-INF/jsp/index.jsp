<%--
  Created by IntelliJ IDEA.
  User: Handsome
  Date: 2018/11/6
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Title</title>
    <%--<script src="../jquery.min.js"></script>--%>
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <style>

        body{
            font-size: 12px;
            font-family: Arial;
        }
        a{
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
        div.searchDiv{
            background-color: #C40000;
            width: 400px;
            margin: 50px auto;
            padding: 1px;
            height: 40px;
            display: block;
        }
        div.searchDiv input{
            width: 275px;
            border: 1px solid transparent;
            height: 36px;
            margin: 1px;
            outline:none;
        }
        div.searchDiv button{
            width: 110px;
            border: 1px solid transparent;
            background-color: #C40000;
            color: white;
            font-size: 20px;
            font-weight: bold;
        }
        div.searchBelow{
            margin-top: 3px;
            margin-left: -20px;
        }
        div.searchBelow span{
            color: #999;
        }
        div.searchBelow a{
            padding: 0px 20px 0px 20px;
            font-size: 14px;
        }
        nav.a{
            color:#999;
        }
        nav.a:hover{
            text-decoration:none;
            color:#C40000;
        }

        /*下边界*/
        .category-tab-content {
            position: relative;
        }

        .normal-nav {
            background-color: rgba(0, 0, 0, .55);
            width: 200px;
            height: 500px;
            position: absolute;
            z-index: 11;
        }

        .nav-item {
            padding-left: 30px;
            positon: relative;
            line-height: 31.2px;
            width: 200px;
            color: #FFFFFF;
            font-size: 14px;
        }

        .normal-nav .nav-item:hover {
            background-color: #FFFFFF;
            color: #e54077;
        }

        li, ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .hot-word-line a {
            margin-left: 13px;
            height: 22px;
            line-height: 22px;
            font-size: 14px;
            float: left;
        }

        div.floor-line-con i {
            background-color: #0AA6E8;
            width: 5px;
            height: 18px;
            display: inline-block;
            vertical-align: middle;
        }

        .grid {
            margin-left: 13px;
            text-align: center;
        }

        .productItem {
            display: block;
            float: left;
            width: 233px;
            height: 300px;
            border: 1px solid #FFFFFF;
        }

        .productItem:hover {
            border: 1px solid #FF0036;
        }

        .floor-item-img {
            margin-top: 20px;
            position: relative;
            width: 185px;
            height: 185px;
        }

        .floor-item-title {
            width: 135px;
            height: 40px;
            font-size: 14px;
            color: #333333;
            line-height: 20px;
            overflow: hidden;
            margin: 8px auto;
        }

        .floor-price {
            font-size: 18px;
            color: #FF0036;
            line-height: 18px;
            margin: 10px auto;
        }
        .carousel-inner{
            margin-left: 200px;
        }


    </style>
    <%--<script>
        function checklogin() {
            if (${sessionScope.user}){
                document.getElementById("login_a").innerText="${sessionScope.user.name},你好";

            }
            else
                document.getElementById("login_a").innerText="请登录";
        }
    </script>--%>
    <script>
        function checklogin() {
            if("${sessionScope.user}"){
                document.getElementById("login_a").innerText="";
                document.getElementById("login_span").innerText="亲爱的${sessionScope.user.name},你好";
                document.getElementById("register_a").innerText="";
            }

        }
    </script>
</head>
<body onload="checklogin()">

<nav class="top">
    <a href="index.html"></a>

    <span class="glyphicon glyphicon-home redColor">喵，欢迎来到狸猫</span>
    <a href="login" id="login_a">请登录</a>
    <span id="login_span"></span>
    <a href="register" id="register_a">免费注册</a>
    <span class="pull-right">
	<a href="bought">我的订单</a>
	<a href="cart"><span class="glyphicon glyphicon-shopping-cart redColor"></span>购物车<strong>0</strong>件</a>
	</span>
</nav>

<div class="searchDiv">
    <form action="/searchResult" method="post">
    <input type="text" name="keyword" placeholder="时尚男鞋  太阳镜">
    <button class="searchButton" type="submit">搜索</button>
    </form>
    <div class="searchBelow">
        <span><a href="/searchResult?keyword=安全座椅"> 安全座椅 </a><span>|</span></span>
        <span><a href="/searchResult?keyword=男子运动"> 男子运动 </a><span>|</span></span>
        <span><a href="/searchResult?keyword=牙膏杯"> 牙膏杯 </a><span>|</span></span>
    </div>
</div>

<%-- 轮播 --%>
<div class="category-con">
    <div class="workArea">

<div class="category-tab-content">
    <ul class="normal-nav">
        <c:forEach items="${categories}" var="c">
            <li class="nav-item" category_id="${c.id}">${c.name}</li>
        </c:forEach>
    </ul>
    <%@include file="include/hot-word-con.jsp" %>
</div>

    <script type="text/javascript">
        function showProductsByCategoryId(category_id) {
            $("div.hot-word-con[category_id=" + category_id + "]").show();
        }

        function hideProductsByCategoryId(category_id) {
            $("div.hot-word-con[category_id=" + category_id + "]").hide();
        }

        $(function () {
            $("li.nav-item").mouseenter(function () {
                var category_id = $(this).attr("category_id");
                showProductsByCategoryId(category_id);
            });
            $("li.nav-item").mouseleave(function () {
                var category_id = $(this).attr("category_id");
                hideProductsByCategoryId(category_id);
            });
            $("div.hot-word-con").mouseenter(function () {
                var category_id = $(this).attr("category_id");
                showProductsByCategoryId(category_id);
            });
            $("div.hot-word-con").mouseleave(function () {
                var category_id = $(this).attr("category_id");
                hideProductsByCategoryId(category_id);
            });
        });

    </script>
    <div style="clear: both;"></div>

    <div data-ride="carousel" class="carousel-of-product carousel" id="carousel-of-product">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li class="active" data-slide-to="0" data-target="#carousel-of-product"></li>
            <li data-slide-to="1" data-target="#carousel-of-product" class=""></li>
            <li data-slide-to="2" data-target="#carousel-of-product" class=""></li>
            <li data-slide-to="3" data-target="#carousel-of-product" class=""></li>
        </ol>
        <!-- Wrapper for slides -->
        <div role="listbox" class="carousel-inner">
            <div class="item active">
               <a href="showproduct?product_id=3"> <img src="img/lunbo/1.png" class="carousel carouselImage"></a>
            </div>
            <div class="item">
                <img src="img/lunbo/2.jpg" class="carouselImage">
            </div>
            <div class="item">
                <img src="img/lunbo/3.png" class="carouselImage">
            </div>
            <div class="item">
                <img src="img/lunbo/4.jpg" class="carouselImage">
            </div>
        </div>
    </div>
    </div>
</div>

<div class="new-floor-con">
    <c:forEach items="${products}" var="p" varStatus="st">
        <c:if test="${st.count<=5}">
            <a class="grid" href="showproduct?product_id=${p.id}">
                <div class="productItem">
                    <img class="floor-item-img" src="img/product/${p.id}/1.jpg">
                    <div class="floor-item-title">${p.name}</div>
                    <div class="floor-price">${p.promotePrice}</div>
                </div>
            </a>
        </c:if>
    </c:forEach>

</div>



</body>
</html>
