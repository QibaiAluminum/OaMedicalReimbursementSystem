<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title> 欢迎使用报销系统 </title>
    <link rel="stylesheet" type="text/css" href="/assets/skin/default_skin/css/theme.css">
    <link rel="stylesheet" type="text/css" href="/assets/admin-tools/admin-forms/css/admin-forms.css">
    <link rel="shortcut icon" href="/assets/img/favicon.ico">
    <script>
        window.onload=function () {
            var post = "${sessionScope.employee.post}".toString();
            if (post == "系统管理员"){
                //默认所有权限
                //日常管理+部门管理+员工管理
            }
            else if (post == "审核负责人"){
                //日常管理+员工管理
                document.getElementsByName("power")[2].style.display="none";
            }
            else if (post == "收单员" || post == "员工"){
                //日常管理
                var p = document.getElementsByName("power");
                for (var i = 0; i < p.length; i++){
                    p[i].style.display = "none";
                }
            }
        }
    </script>
</head>

<body class="admin-validation-page" data-spy="scroll" data-target="#nav-spy" data-offset="200">
<div id="main">
    <header class="navbar navbar-fixed-top navbar-shadow">
        <div class="navbar-branding">
            <a class="navbar-brand" href="/self">
                <b>公费医疗</b>报销系统
            </a>
            <span id="toggle_sidemenu_l" class="ad ad-lines"></span>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown menu-merge">
                <a href="#" class="dropdown-toggle fw600 p15" data-toggle="dropdown">

                    <span id="pc" class="hidden-xs pl15"> ${sessionScope.employee.name} </span>
                    <span class="caret caret-tp hidden-xs"></span>
                </a>
                <ul class="dropdown-menu list-group dropdown-persist w250" role="menu">
                    <li class="list-group-item">
                        <a href="/self" class="animated animated-short fadeInUp">
                            <span class="fa fa-user"></span> 个人信息
                            <span class="label label-warning"></span>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="/to_change_password" class="animated animated-short fadeInUp">
                            <span class="fa fa-gear"></span> 设置密码 </a>
                    </li>
                    <li class="dropdown-footer">
                        <a href="/quit" class="">
                            <span class="fa fa-power-off pr5"></span> 退出 </a>
                    </li>
                </ul>
            </li>
        </ul>
    </header>
    <aside id="sidebar_left" class="nano nano-light affix">
        <div class="sidebar-left-content nano-content">
            <header class="sidebar-header">
                <div class="sidebar-widget author-widget">
                    <div class="media">
                        <a class="media-left" href="#">

                        </a>
                        <div class="media-body">
                            <div class="media-author">${sessionScope.employee.name}--${sessionScope.employee.post}</div>
                            <div class="media-links">
                                <a href="/quit">退出</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sidebar-widget search-widget hidden">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-search"></i>
                        </span>
                        <input type="text" id="sidebar-search" class="form-control" placeholder="Search...">
                    </div>
                </div>
            </header>
            <ul class="nav sidebar-menu">
                <li class="sidebar-label pt20">日常管理</li>
                <li>
                    <a href="/claim_voucher/deal">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">待处理报销单</span>
                    </a>
                </li>
                <li>
                    <a href="/claim_voucher/self">
                        <span class="glyphicon glyphicon-home"></span>
                        <span class="sidebar-title">个人报销单</span>
                    </a>
                </li>
                <li>
                    <a href="/claim_voucher/to_add">
                        <span class="fa fa-calendar"></span>
                        <span class="sidebar-title">填写报销单</span>
                    </a>
                </li>
                <li name="power" class="sidebar-label pt15">基础信息管理</li>
                <li name="power">
                    <a class="accordion-toggle" href="#">
                        <span class="glyphicon glyphicon-check"></span>
                        <span class="sidebar-title">员工管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li>
                            <a href="/employee/list">
                                <span class="glyphicon glyphicon-calendar"></span> 所有员工 </a>
                        </li>
                        <li>
                            <a href="/employee/to_add">
                                <span class="glyphicon glyphicon-check"></span> 添加员工 </a>
                        </li>
                    </ul>
                </li>
                <li name="power">
                    <a class="accordion-toggle" href="#">
                        <span class="fa fa-columns"></span>
                        <span class="sidebar-title">部门管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li>
                            <a href="/department/list">
                                <span class="glyphicon glyphicon-calendar"></span> 所有部门 </a>
                        </li>
                        <li>
                            <a href="/department/to_add">
                                <span class="glyphicon glyphicon-check"></span> 添加部门 </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="sidebar-toggle-mini">
                <a href="#">
                    <span class="fa fa-sign-out"></span>
                </a>
            </div>
        </div>
    </aside>
    <section id="content_wrapper">