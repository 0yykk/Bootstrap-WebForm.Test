<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BootstrapTestDemo.Page.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title></title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/bootstrap-table.min.css">
</head>
<body>
    <table id="table"></table>
    <div id="toolbar" class="btn-group">
        <button id="btn_add" type="button" class="btn btn-success">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="btn_edit" type="button" class="btn btn-info">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
        </button>
        <button id="btn_delete" type="button" class="btn btn-warning">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
        </button>
    </div>
    <script src="/js/jquery-3.4.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-table.min.js"></script>
    <script src="/bootstrap-table-zh-CN.min.js"></script>
    </body>
    <script>
         $('#table').bootstrapTable({
            url: "test.ashx",
            cache: false,//是否使用缓存
            method: "post",
            toolbar: "#toolbar",
            showRefresh: true,//刷新按钮
            sortStable: true,//是否支持排序
            contentType: "application/x-www-form-urlencoded",//post请求必须要有，否则后台接受不到参数
            pagination: true,//是否显示分页
            sidePagination: "server",//设置在服务端还是客户端分页
            pageNumber: 1,//首页页码，默认为1
            pageSize: 10,//页面数据条数,默认为10
            search: true,//是够有搜索框
            clickToSelect: true,//点击是否选中行
            queryParamsType: "",
            queryParams: function (params) {
                return {
                    pageSize: params.pageSize,//pageSize
                    pageNumber: params.pageNumber,//偏移量
                    sortName: params.sortName,//以哪个字段排序
                    sortOrder: params.sortOrder,//降序还是升序,asc,desc
                    searchText: params.searchText//搜索关键字
                };
            },
            formatLoadingMessage: function () {
                return "请稍后，正在加载....";
            },
            formatNoMatches: function () {
                return "暂无匹配数据.";
            },
            columns: [{
                field: "select",
                title: "全选",
                checkbox:true,
            }, {
                field: 'LAB_NO',
                title: '实验室账号',
                sortable:true
            }, {
                field: 'LAB_NAME',
                title: '实验室名称'
            }, {
                field: 'PHONE',
                title: '手机号'
            }, {
                field: 'MAIL',
                title: '邮箱'
            }, {
                field: 'CONTACT',
                title: '联系人'
            }, {
                field: 'USER_FUNC',
                title: '用户权限'
            }]
        });

    </script>
</html>
