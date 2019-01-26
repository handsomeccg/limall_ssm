<%--
  Created by IntelliJ IDEA.
  User: Handsome
  Date: 2018/10/18
  Time: 22:25
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
            <h1>属性管理</h1>
            <table class="table table-striped" id="catetable">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>产品名称</th>
                    <th>产品标题</th>
                    <th>原价</th>
                    <th>折扣价</th>
                    <th>库存</th>
                    <th>分类ID</th>

                    <th>编辑产品</th>
                    <th>编辑图片</th>
                    <th>编辑属性</th>
                    <th>删除</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${cs}" var="p">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.name}</td>
                        <td>${p.subTitle}</td>
                        <td>${p.originalPrice}</td>
                        <td>${p.promotePrice}</td>
                        <td>${p.stock}</td>
                        <td>${p.cid}</td>

                        <td><a href="admin_product_edit?id=${p.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                        <td><a href="admin_listimage?pid=${p.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                        <td><a href="admin_propertyValue_list?pid=${p.id}&cid=${category.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                        <td><a href="admin_product_delete?id=${p.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">增加产品</div>
                    <div class="panel-body">
                <form method="post" id="editForm" action="admin_product_add"
                      enctype="multipart/form-data">
                    <table class="editTable">
                        <tr>
                            <td>产品名称</td>
                            <td><input id="name" name="name" value="${p.name}" type="text"
                                       class="form-control"></td>
                        </tr>
                        <tr>
                            <td>产品标题</td>
                            <td><input id="subTitle" name="subTitle" value="${p.subTitle}" type="text"
                            class="form-control"></td>
                        </tr>
                        <tr>
                            <td>原价</td>
                            <td><input id="originalPrice" name="originalPrice" value="${p.originalPrice}" type="text"
                                       class="form-control"></td>
                        </tr>
                        <tr>
                            <td>折扣价</td>
                            <td><input id="promotePrice" name="promotePrice" value="${p.promotePrice}" type="text"
                                       class="form-control"></td>
                        </tr>
                        <tr>
                            <td>库存</td>
                            <td><input id="stock" name="stock" value="${p.stock}" type="text"
                                       class="form-control"></td>
                        </tr>
                        <tr class="submitTR">
                            <td colspan="2" align="center">

                                <input type="hidden" name="cid" value="${category.id}">
                                <button type="submit" class="btn btn-success">提交</button>
                            </td>
                        </tr>
                    </table>
                </form>
                    </div>
                </div>
            </div>
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