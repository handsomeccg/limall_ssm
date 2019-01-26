<%--
  Created by IntelliJ IDEA.
  User: Handsome
  Date: 2018/11/22
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/top.jsp" %>
<html>
<head>
    <title>Title</title>
<style>
    div.orderFinishDiv{
        border: 1px solid #E5E5E5;
        padding: 40px;
        max-width: 1013px;
        margin: 10px auto;
    }
    div.orderFinishDiv span{
        font-size: 14px;
        color: black;
        font-weight: bold;
        margin-left: 20px;
        padding-top: 20px;
    }
</style>
</head>
<body>
<div class="orderFinishDiv">
    <div class="orderFinishTextDiv">
        <img src="img/site/orderFinish.png">
        <span>交易已经成功，卖家将收到您的货款。</span>
    </div>
</div>
</body>
</html>
