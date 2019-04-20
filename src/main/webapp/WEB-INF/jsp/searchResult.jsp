<%--
  Created by IntelliJ IDEA.
  User: Handsome
  Date: 2018/11/24
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/top.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<style>
    div.searchProducts {
        margin-top: 80px;
        padding-left: 5px;
        padding-right: 5px;
    }

    .filter {
        boder-top: 1px solid #e5e5e5;
        margin: 10px 0;
        padding: 5px;
        position: relative;
        z-index: 10;
        background: #faf9f9;
        color: #806f66;
    }

    .fSort:hover, a.fSort-cur, a.fType-cur {
        color: #FF0036;
        background-color: #F1EDEC;
    }

    .fSort {
        display: inline-block;
        margin-left: -1px;
        overflow: hidden;
        padding: 0 15px 0 5px;
        float: left;
        height: 22px;
        line-height: 20px;
        border: 1px solid #CCCCCC;
        z-index: 10;
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
</style>
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
<div class="workArea">
    <div class="searchProducts">
        <%--<div class="filter">
            <a class="fSort"
               <c:if test="${'all'==param.sort||empty param.sort}">class="fSort-cur"</c:if>
               href="/sortProduct?sort=all&keyword=${param.keyword}">综合</a>
            <a class="fSort"
               <c:if test="${'reviewCount'==param.sort}">class="fSort-cur"</c:if>
               href="/sortProduct?sort=reviewCount&keyword=${param.keyword}">人气</a>
            <a class="fSort"
               <c:if test="${'date'==param.sort}">class="fSort-cur"</c:if>
               href="/sortProduct?sort=date&keyword=${param.keyword}">新品</a>
            <a class="fSort"
               <c:if test="${'sale'==param.sort}">class="fSort-cur"</c:if>
               href="/sortProduct?sort=sale&keyword=${param.keyword}">销量</a>
            <a class="fSort"
               <c:if test="${'promotePrice'==param.sort}">class="fSort-cur"</c:if>
               href="/sortProduct?sort=promotePrice&keyword=${param.keyword}">价格</a>
        </div>--%>
        <div style="clear: both;"></div>
        <style>
            .product {
                margin-top: 40px;
                margin-right: 20px;
                margin-bottom: 20px;
                width: 220px;
                height: 290px;
                position: relative;
                float: left;
                padding: 0;
                /*margin: 0 0 20px;*/
                line-height: 1.5;
                overflow: visible;
                z-index: 1;
            }

            .product-hover .product-iWrap, .product:hover .product-iWrap {
                height: auto;
                margin: -3px;
                border: 4px solid #ff0036;
                border-radius: 0;
                -webkit-transition: border-color .2s ease-in;
                -moz-transition: border-color .2s ease-in;
                -ms-transition: border-color .2s ease-in;
                -o-transition: border-color .2s ease-in;
                transition: border-color .2s ease-in;
            }

            .product:hover {
                overflow: visible;
                z-index: 3;
                background: #fff;
            }

            .product-iWrap {
                min-height: 98%;
                width: 210px;
                position: absolute;
                background-color: #fff;
                margin: 0;
                padding: 4px 4px 0;
                font-size: 12px;
                border: 1px solid #f5f5f5;
                border-radius: 3px;
            }

            .productImg-wrap a, .productImg-wrap img {
                max-width: 100%;
                max-height: 210px;
            }

            .productPrice {
                font-family: arial, verdana, sans-serif !important;
                color: #ff0036;
                font-size: 14px;
                height: 30px;
                line-height: 30px;
                margin: 0 0 5px;
                letter-spacing: normal;
                overflow: inherit !important;
                white-space: nowrap;
            }

            .productPrice em {
                float: left;
                font-family: arial;
                font-weight: 400;
                font-size: 20px;
                color: #ff0036;
            }

            .productPrice em b {
                margin-right: 2px;
                font-weight: 700;
                font-size: 14px;
                vertical-align: middle;
            }

            .productTitle {
                display: block;
                color: #666;
                height: 14px;
                line-height: 12px;
                margin-bottom: 3px;
                word-break: break-all;
                position: relative;
                overflow: hidden;

            }

            .productTitle a {
                color: #333;
                font-family: 微软雅黑;
                line-height: 14px;
                font-size: 12px;
            }

            .productStatus {
                position: relative;
                height: 33px;
                border: none;
                border-top: 1px solid #eee;
                margin-bottom: 0;
                color: #999;
                display: block;
                overflow: hidden;
            }

            .productStatus em {
                color: #b57c5b;
            }

            .productStatus a, .productStatus em {
                margin-top: -8px;
                font-family: arial;
                font-size: 12px;
                font-weight: 700;
            }

            em {
                font-style: normal;
            }

            .productStatus span {
                float: left;
                display: inline-block;
                border-right: 1px solid #eee;
                width: 39%;
                padding: 10px 1px;
                margin-right: 6px;
                line-height: 12px;
                text-align: left;
                white-space: nowrap;
            }

            .productStatus a {
                color: #38b;
            }

            .productStatus .ww-light {
                border-right: none;
                width: 11%;
                text-align: center;
            }

            .productStatus .ww-light a {
                background: url(/img/site/ww-online.png) center center no-repeat !important;
                background-size: 16px !important;
                position: relative;
                width: 16px;
                height: 16px;
                margin-top: -3px;
                overflow: hidden;
                display: inline-block;
                vertical-align: text-bottom;
            }
        </style>


        <c:forEach items="${products}" var="p">
            <div class="product">
                <div class="product-iWrap">
                    <div class="productImg-wrap">
                        <a class="productImg" href="/showproduct?product_id=${p.id}">
                            <img src="/img/product/${p.id}/1.jpg">
                        </a>
                    </div>
                    <div style="clear: both;"></div>
                    <p class="productPrice">
                        <em title="${p.promotePrice}">
                            <b>￥</b>${p.promotePrice}
                        </em>
                    </p>
                    <div style="clear: both;"></div>
                    <p class="productTitle">
                        <a href="/showproduct?product_id=${p.id}">${p.name}</a>
                    </p>
                    <%--<p class="productStatus">
                        <span>销量<em>${p.sale}</em></span>
                        <span>评价<a href="#nowhere">${p.reviewCount}</a></span>
                        <span class="ww-light"><a></a></span>
                    </p>--%>
                </div>
            </div>
        </c:forEach>


        <style>
            .nrt {
                background: url(/img/site/no-product.png) 35px center no-repeat #fff8f6;
                color: #595959;
                margin-bottom: 10px;
                padding: 20px 0 20px 123px;
                line-height: 27px;
                font-size: 14px;
                border: 1px solid #F7EAE7;
                margin-top: 25px;
            }
        </style>

        <c:if test="${empty products}">
            <div class="nrt">
                <p>
                    喵~没找到与
                    <em>" ${param.keyword} "</em>
                    相关的商品哦。
                </p>
            </div>
        </c:if>
        <div style="clear:both"></div>
    </div>
</div>
</body>
</html>
