<%--
  Created by IntelliJ IDEA.
  User: Handsome
  Date: 2018/11/22
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<style>
    div.makeReviewDiv {
        border: 1px solid #D1CCC8;
        margin: 20px 0px;
        background-color: #EFEFEF;
    }

    div.makeReviewText {
        font-size: 16px;
        color: #333333;
        font-weight: bold;
        margin: 20px 40px;
    }

    table.makeReviewTable {
        margin: 20px 40px;
        font-size: 12px;
    }

    table.makeReviewTable td {
        border: 1px solid #E7E7E7;
        padding: 10px;
        background-color: white;
    }

    table.makeReviewTable textarea {
        border-width: 0px;
        resize: none;
        width: 420px;
        height: 120px;
    }

    td.makeReviewTableFirstTD {
        background-color: #F6F6F6;
    }

    div.makeReviewButtonDiv {
        background-color: white;
        text-align: center;
        padding: 15px;
    }

    div.makeReviewButtonDiv button {
        width: 72px;
        height: 26px;
        border-radius: 2px;
        background-color: #FF0036;
        color: white;
        border-width: 0px;
        font-weight: bold;
    }

    div.reviewDate {
        width: 100px;
    }

    div.reviewDivlistReviewsEach div {
        display: inline-block;
    }

    div.reviewDate {
        color: #CCCCDD;
    }

    div.reviewContent {
        color: #333333;
        width: 698px;
    }

    div.reviewUserInfo {
        color: #333333;
    }

    div.reviewDivlistReviewsEach {
        padding: 20px;
        border-bottom: 1px solid #ECECEC;
    }

    span.reviewUserInfoAnonymous {
        color: #CCCCDD;
        margin-left: 5px;
    }
</style>
</head>
<body>
<div class="makeReviewDiv">
    <form method="post" action="/reviewCommit">
        <div class="makeReviewText">其他买家，需要你的建议哦！</div>
        <table class="makeReviewTable">
            <tr>
                <td class="makeReviewTableFirstTD">评价商品</td>
                <td>产品名称：${product.name}</td>
                <td><textarea name="content"></textarea></td>
            </tr>
        </table>
        <div class="makeReviewButtonDiv">
            <input type="hidden" name="oid" value="${order.id}">
            <input type="hidden" name="pid" value="${product.id}">
            <input type="hidden" name="oi_id" value="${orderitem.id}">
            <button type="submit">提交评价</button>
        </div>
    </form>
</div>
</body>
</html>
