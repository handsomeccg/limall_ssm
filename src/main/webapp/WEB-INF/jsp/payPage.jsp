<%--
  Created by IntelliJ IDEA.
  User: Handsome
  Date: 2018/11/11
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<style>
    div.aliPayPageDiv{
        text-align: center;
        padding-bottom: 40px;
        max-width: 1013px;
        margin: 10px auto;
    }

    span.confirmMoneyText{
        color: #4D4D4D;
    }
    span.confirmMoney{
        display: block;
        color: #FF6600;
        font-weight: bold;
        font-size: 20px;
        margin: 10px;
    }
    button.confirmPay{
        background-color: #00AAEE;
        border: 1px solid #00AAEE;
        text-align: center;
        line-height: 31px;
        font-size: 14px;
        font-weight: 700;
        color: white;
        width: 107px;
        margin-top: 20px;
    }

    img.aliPayImg {
        width: 300px;
    }
</style>
</head>
<body>
<div class="aliPayPageDiv">

    <div>
        <span class="confirmMoneyText">扫一扫付款（元）</span>
        <span class="confirmMoney">￥${total}</span>
    </div>
    <div>
        <img class="aliPayImg" src="img/pay/zfbpic.JPG">
    </div>


    <div>
        <a href="payed?oid=${oid}&total=${total}">
            <button class="confirmPay">确认支付</button>
        </a>
    </div>

</div>
</body>
</html>
