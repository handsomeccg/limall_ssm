<%--
  Created by IntelliJ IDEA.
  User: Handsome
  Date: 2018/11/9
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
    <title>Typography</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
    <style type="text/css">
        #catetable{
            margin-top: 30px;
            margin-left: 30px;
        }
    </style>
</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand">
            <a href="index.html"><img src="assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
        </div>
        <div class="container-fluid">
            <div class="navbar-btn">
                <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
            </div>

        </div>
    </nav>
    <!-- END NAVBAR -->
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="admin_category_list" class=""><i class="lnr lnr-home"></i> <span>分类管理</span></a></li>
                    <li><a href="admin_user_list" class=""><i class="lnr lnr-user"></i> <span>用户管理</span></a></li>
                    <li><a href="admin_order" class=""><i class="lnr lnr-chart-bars"></i> <span>订单管理</span></a></li>
                    <li><a href="#" class=""><i class="lnr lnr-linearicons"></i> <span>Icons</span></a></li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- END LEFT SIDEBAR -->
    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div>
            <h1>订单管理</h1>
            <table class="table table-striped" id="catetable">
                <thead>
                <tr>
                    <th>订单编号</th>
                    <th>收货地址</th>
                    <th>邮编</th>
                    <th>收件人</th>
                    <th>联系电话</th>
                    <th>用户留言</th>
                    <th>创建日期</th>
                    <th>支付日期</th>
                    <th>发货日期</th>
                    <th>收货日期</th>
                    <th>订单状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orders}" var="o">
                    <tr>
                        <td>${o.orderCode}</td>
                        <td>${o.address}</td>
                        <td>${o.post}</td>
                        <td>${o.receiver}</td>
                        <td>${o.mobile}</td>
                        <td>${o.userMessage}</td>
                        <td>${o.createDate}</td>
                        <td>${o.payDate}</td>
                        <td>${o.confirmDate}</td>
                        <td>${o.confirmDate}</td>
                        <td>${o.status}</td>
                        <td>
                            <c:if test="${o.status=='waitDelivery'}">
                                <a href="orderDelivery?oid=${o.id}">
                                    <button class="btn btn-primary btn-xs">发货</button>
                                </a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- END MAIN CONTENT -->
    </div>

    <!-- END MAIN -->
    <div class="clearfix"></div>
    <footer>
        <div class="container-fluid">
            <p class="copyright">基于ssm的电商系统 author:ccg <a href="https://yanhuo47.coding.me/" target="_blank" title="">blog</a></p>
        </div>
    </footer>
</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/scripts/klorofil-common.js"></script>
</body>

</html>
