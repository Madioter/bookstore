<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=8">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>主页</title>
    <link rel="stylesheet" type="text/css" href="${basePath}resources/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${basePath}resources/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${basePath}resources/easyui/demo/demo.css">
    <script type="text/javascript" src="${basePath}resources/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}resources/easyui/jquery.easyui.min.js"></script>
    <style>
        .tabs-panels {
            padding: 10px;
        }
    </style>
</head>
<body class="easyui-layout">
<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">
    <h2>后台管理系统</h2>
</div>
<div data-options="region:'west',split:true,collapsed:true,
				hideExpandTool: true,
				expandMode: null,
				hideCollapsedContent: false,
				collapsedSize: 68,
				collapsedContent: function(){
					return $('#titlebar');
				}
				" title="West" style="width:100px;">
    <div id="titlebar" style="padding:2px">
        <a href="javascript:void(0)" class="easyui-linkbutton" style="width:100%" id="book"
           data-options="iconCls:'icon-large-picture',size:'large',iconAlign:'top'">书籍管理</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" style="width:100%" id="dictionary"
           data-options="iconCls:'icon-large-shapes',size:'large',iconAlign:'top'">分类管理</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" style="width:100%" id="notice"
           data-options="iconCls:'icon-large-shapes',size:'large',iconAlign:'top'">告示栏管理</a>
        <%--<a href="javascript:void(0)" class="easyui-linkbutton" style="width:100%" id="channel"
           data-options="iconCls:'icon-large-smartart',size:'large',iconAlign:'top'">通道管理</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" style="width:100%" id="logger"
           data-options="iconCls:'icon-large-chart',size:'large',iconAlign:'top'">日志分析</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" style="width:100%" id="tools"
           data-options="iconCls:'icon-large-tool',size:'large',iconAlign:'top'">解析工具</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" style="width:100%" id="sender"
           data-options="iconCls:'icon-large-tool',size:'large',iconAlign:'top'">消息发送</a>--%>
    </div>
</div>
<div data-options="region:'center',title:''">
    <div class="easyui-tabs" data-options="fit:true,border:false,plain:true" style="height:700px">
        <div id="bookTab" title="书籍管理" data-options="href:'${basePath}book/bookPage', closable: true"></div>
    </div>
</div>
</body>
<script type="text/javascript">
    function removePanel() {
        var tab = $('#tt').tabs('getSelected');
        if (tab) {
            var index = $('#tt').tabs('getTabIndex', tab);
            $('.easyui-tabs').tabs('close', index);
        }
    }

    $(function () {
        $.ajaxSetup({
            cache: false
        });

        $("#dictionary").click(function () {
            if ($(".easyui-tabs #dictionaryTab").size() == 0) {
                $('.easyui-tabs').tabs('add', {
                    title: '分类管理',
                    content: '<div></div>',
                    closable: true,
                    href: '${basePath}dictionary/dictionaryPage',
                    id: 'dictionaryTab'
                });
            } else {
                $(".easyui-tabs").tabs('select', '分类管理');
            }
        });

        $("#task").click(function () {
            if ($(".easyui-tabs #taskTab").size() == 0) {
                $('.easyui-tabs').tabs('add', {
                    title: '任务管理',
                    content: '<div></div>',
                    closable: true,
                    href: '${basePath}task/taskPage',
                    id: 'taskTab'
                });
            } else {
                $(".easyui-tabs").tabs('select', '任务管理');
            }
        });

        $("#channel").click(function () {
            if ($(".easyui-tabs #channelTab").size() == 0) {
                $('.easyui-tabs').tabs('add', {
                    title: '通道管理',
                    content: '<div></div>',
                    closable: true,
                    href: '${basePath}channel/channelPage',
                    id: 'channelTab'
                });
            } else {
                $(".easyui-tabs").tabs('select', '通道管理');
            }
        });

        $("#logger").click(function () {
            if ($(".easyui-tabs #loggerTab").size() == 0) {
                $('.easyui-tabs').tabs('add', {
                    title: '日志分析',
                    content: '<div></div>',
                    closable: true,
                    href: '${basePath}logger/loggerPage',
                    id: 'loggerTab'
                });
            } else {
                $(".easyui-tabs").tabs('select', '日志分析');
            }
        });

        $("#tools").click(function () {
            if ($(".easyui-tabs #toolTab").size() == 0) {
                $('.easyui-tabs').tabs('add', {
                    title: '解析工具',
                    content: '<div></div>',
                    closable: true,
                    href: '${basePath}tool/toolPage',
                    id: 'toolTab'
                });
            } else {
                $(".easyui-tabs").tabs('select', '解析工具');
            }
        });

        $("#sender").click(function () {
            if ($(".easyui-tabs #senderTab").size() == 0) {
                $('.easyui-tabs').tabs('add', {
                    title: '消息发送',
                    content: '<div></div>',
                    closable: true,
                    href: '${basePath}message/senderPage',
                    id: 'senderTab'
                });
            } else {
                $(".easyui-tabs").tabs('select', '消息发送');
            }
        });
    });
</script>
</html>
