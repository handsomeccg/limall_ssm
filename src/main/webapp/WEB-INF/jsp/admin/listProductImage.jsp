<%--
  Created by IntelliJ IDEA.
  User: Handsome
  Date: 2018/11/14
  Time: 15:38
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
                    <li><a href="icons.html" class=""><i class="lnr lnr-linearicons"></i> <span>Icons</span></a></li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- END LEFT SIDEBAR -->
    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div>
            <h1>产品图片管理</h1>
            <table class="table table-striped" id="catetable">
                <thead>
                <tr>
                    <th>产品ID</th>
                    <th>图片ID</th>
                    <th>图片预览</th>
                    <th>图片编辑</th>
                    <th>删除图片</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${productimages}" var="p">
                    <tr>
                        <td>${p.pid}</td>
                        <td>${p.id}</td>
                        <td><img class="col-md-4" src="img/product/${p.pid}/${p.id%5==0?5:p.id%5}.jpg" onerror="this.src='img/product/error.png'"> </td>
                        <td class="col-md-4">
                            <form action="/admin_updateimage" enctype="multipart/form-data" method="post">
                                <input type="hidden" name="id" value="${p.id}">
                                <input type="hidden" name="pid" value="${p.pid}">
                                <input type="file" name="img" class="pull-right">
                                <input type="submit" class="btn btn-primary pull-right" value="上传">
                            </form>
                        </td>
                        <td><a href="admin_deleteimage?id=${p.id}&pid=${p.pid}"><span class="glyphicon glyphicon-trash"></span></a></td>
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
