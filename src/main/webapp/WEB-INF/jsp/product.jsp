<%--
  Created by IntelliJ IDEA.
  User: Handsome
  Date: 2018/11/8
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/top.jsp" %>
<html>
<head>
    <title>Title</title>
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" />
<style>

    /*上边框*/

    .top-shop{
        height: 400px;
        width: 1920px;
        margin-top: 100px;
    }
    .leftimg-1{
        position: relative;
        width: 400px;
        height: 400px;
        float:left;
    }
    .bottom{
        margin-top: 100px;
    }
    .right{
        width:500px;
        margin-left: 200px;
        float:left;
        font-size: 15px;
        /*padding: 10px 10px;*/
    }
    .right div{
        margin:10px;border:0;padding:0;
    }
    .shopname{
        color: black;
        font-size: 20px;
        font-weight: bold;
    }
    .shoptitle{
        color: red;
        font-size: 14px;
    }
    .oprice{
        color:red;
        font-size:22px;
    }
    .pprice{
        color:red;
        font-size:26px;
    }
    .leftimg{
        margin-left: 100px;
    }
    button.addCartButton {
        border: 1px solid #FF0036;
        background-color: #FF0036;
        text-align: center;
        line-height: 40px;
        font-size: 16px;
        color: white;
    }
    button.buyButton {
        border: 1px solid #FF0036;
        background-color: #FFEDED;
        text-align: center;
        line-height: 40px;
        font-size: 16px;
        color: #FF0036;
    }

    button.addCartButton span.glyphicon {
        font-size: 12px;
        margin-right: 8px;
    }
</style>

</head>
<body>


<div class="top-shop">
    <div class="leftimg">
        <img class="leftimg-1" src="img/product/${products.id}/1.jpg">
    </div>

    <div class="right">
        <div class="shopname">
            ${products.name}
        </div>
        <div class="shoptitle">
            ${products.subTitle}
        </div>
        <div class="opriceDiv">
            <span class="yjia">原价</span>
            <span class="rmb">¥</span>
            <span class="oprice">${products.originalPrice}</span>
        </div>
        <div class="ppriceDiv">
            <span class="cxjia">促销价</span>
            <span class="crmb">¥</span>
            <span class="pprice">${products.promotePrice}</span>
        </div>
        <div class="stockDiv">
            <span class="kucun">库存</span>
            <span class="stock">${products.stock}</span>
        </div>
        <div class="productNumber">
            <span>数量</span>
            <span>
                <span class="productNumberSettingSpan">
                <input type="text" id="number" value="1" class="productNumberSetting">
                </span>
					<span class="arrow">
                    <a class="increaseNumber" href="#nowhere">
                    <span class="updown">
                       <img src="img/site/increase.png">
                    </span>
					</a>
					<span class="updownMiddle"> </span>
					<a class="decreaseNumber" href="#nowhere">
						<span class="updown">
                        <img src="img/site/decrease.png">
                    </span>
					</a>
					</span>
					件</span>
            <span>库存${products.stock}件</span>
        </div>
        <a onclick="javascript:buyLink()" class="buyLink"><button class="buyButton">立即购买</button></a>

        <a class="addCartLink" href="#nowhere">
            <button class="addCartButton"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</button></a>
    </div>

</div>


<div style="clear: both;"></div>

<style>
    div.productDetailDiv {
        width: 790px;
        margin: 40px auto;
    }

    div.productDetailTopPart {
        border: 1px solid #DFDFDF;
        border-left-width: 0px;
    }

    a.selected {
        border-left: 1px solid #cfbfb1;
        border-right: 1px solid #cfbfb1;
        color: #FF0036;
        display: inline-block;
        font-weight: bold;
        line-height: 46px;
        width: 90px;
        text-align: center;
        position: relative;
    }

    a.selected:before {
        content: "";
        display: block;
        border-width: 1px;
        border-color: #FF0036;
        border-style: solid;
        width: 90px;
        height: 0;
        position: absolute;
        top: -1px;
        margin-left: -1px;
    }

    a.selected:after {
        content: "";
        display: block;
        border-color: #FF0036 transparent transparent;
        border-style: solid;
        border-width: 5px;
        width: 0;
        height: 0;
        position: absolute;
        top: -1px;
        left: 50%;
        margin-left: -5px;
    }

    a.productDetailTopReviewLink {
        padding: 0px 20px;
        border-right: 1px dotted #D2D2D2;
        color: #333333;
    }

    span.productDetailTopReviewLinkNumber {
        color: #3355B9;
    }

    div.productParamterPart {
        border: 1px solid #DFDFDF;
        padding: 40px;
    }

    div.productParamter {
        color: #999999;
        font-weight: bold;
        margin-bottom: 20px;
    }

    div.productParamterList span {
        display: block;
        width: 220px;
        float: left;
        padding: 8px 0px;
        color: #666666;
    }

    div.productDetailImagesPart img {
        display: block;
        width: 790px;
        margin: 20px 0px;
    }

    div.productReviewDiv {
        width: 790px;
        margin: 40px auto;
    }

    div.productReviewTopPart {
        border: 1px solid #DFDFDF;
    }

    a.productReviewTopPartSelectedLink {
        padding: 0px 20px;
        color: #333333;
    }

    div.productReviewContentPart {
        padding-top: 50px;
    }

    div.productReviewItem {
        border-bottom: 1px solid #E3E3E3;
        margin: 10px 0px;
    }

    div.productReviewContentPart {
        padding-top: 50px;
    }

    div.productReviewItem {
        border-bottom: 1px solid #E3E3E3;
        margin: 10px 0px;
    }

    div.productReviewItem div.productReviewItemDesc {
        width: 80%;
        display: inline-block;
        color: #333333;
        margin: 5px 20px;
        float: left;
    }

    div.productReviewItemDate {
        margin: 15px 0px 0px 0px;
        color: #CCCCCC;
    }

    div.productReviewItem div.productReviewItemUserInfo {
        color: #404040;
        margin: 5px 20px;
        padding: 20px 0;
    }

    span.userInfoGrayPart {
        color: #999999;
    }
</style>

<div class="productDetailDiv" style="display: block;">
    <div class="productDetailTopPart">
        <a class="productDetailTopPartSelectedLink selected" href="#nowhere">商品详情</a>
        <a class="productDetailTopReviewLink" href="#nowhere">累计评价 <span
                class="productDetailTopReviewLinkNumber"><%--${product.reviewCount}--%></span> </a>
    </div>

    <div class="productParamterPart">
        <div class="productParamter">产品参数：</div>
        <div class="productParamterList">
            <c:forEach items="${propertyValues}" var="pvs">
                <span>${pvs.property.name}:${pvs.value}</span>
            </c:forEach>
        </div>
        <div style="clear:both"></div>
    </div>
    <div class="productDetailImagesPart">
        <img src="img/product/${products.id}/2.jpg">
        <img src="img/product/${products.id}/3.jpg">
        <img src="img/product/${products.id}/4.jpg">

        <%--<img src="http://how2j.cn/tmall/img/productDetail/8626.jpg">--%>
    </div>
</div>
<div style="clear:both"></div>
<div class="productReviewDiv" style="display: block;">
    <div class="productReviewTopPart">
        <div class="productReviewTopPart">
            <a class="productReviewTopPartSelectedLink" href="#nowhere">商品详情</a>
            <a class="selected" href="#nowhere">累计评价 <span
                    class="productReviewTopReviewLinkNumber">${product.reviewCount}</span> </a>
        </div>
        <div class="productReviewContentPart">
            <c:forEach items="${reviews}" var="r">
                <div class="productReviewItem">
                    <div class="productReviewItemDesc">
                        <div class="productReviewItemContent">
                                ${r.content}
                        </div>
                        <div class="productReviewItemDate">${r.createDate}</div>
                    </div>
                    <div class="productReviewItemUserInfo">
                            <%--${r.user.anonymousName}--%><span class="userInfoGrayPart">${r.user.name}</span>
                    </div>
                    <div style="clear:both"></div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script>
    $(function(){
        $(".increaseNumber").click(function () {
            var num = $(".productNumberSetting").val();
            num++;
            if (num > ${products.stock})
                num = ${products.stock};
            $(".productNumberSetting").val(num);
        });
        $(".decreaseNumber").click(function () {
            var num = $(".productNumberSetting").val();
            --num;
            if (num <= 0)
                num = 1;
            $(".productNumberSetting").val(num);
        });

        $("div.productReviewDiv").hide();
        $("a.productDetailTopReviewLink").click(function () {
            $("div.productReviewDiv").show();
            $("div.productDetailDiv").hide();
        });
        $("a.productReviewTopPartSelectedLink").click(function () {
            $("div.productReviewDiv").hide();
            $("div.productDetailDiv").show();
        });

        $(".addCartLink").click(function () {
            var page = "checklogin";
            $.get(
                page,
                function (result) {
                    if ("success" == result) {
                        var product_id = ${products.id};
                        var number = $(".productNumberSetting").val();
                        var addCartpage = "/addcart";
                        $.get(
                            addCartpage,
                            {"product_id": product_id, "number": number},
                            function (result) {
                                if ("success" == result) {
                                    $(".addCartButton").html("已加入购物车");
                                    $(".addCartButton").attr("disabled", "disabled");
                                    $(".addCartButton").css("background-color", "lightgray");
                                    $(".addCartButton").css("border-color", "lightgray");
                                    $(".addCartButton").css("color", "black");
                                }
                                else {
                                }
                            }
                        );
                    }
                    else {
                        /*$("#loginModal").modal('show');*/
                        window.location = "login";
                    }
                }
            );
            return false;
        });
    })

    function buyLink() {
        window.location = "showbuy?product_id="+ ${products.id} +"&number="+ $("#number").val();
    }
</script>

</body>
</html>
