<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<table class="easyui-datagrid" id="loggerList"
       data-options="url:'${basePath}logger/loggerList?random=' + new Date().getTime(),method:'get',singleSelect:false,fit:false,
       width: $(window).width() - 90, height: $(window).height() - 150,
       fitColumns:true,nowrap: false, rownumbers: true, pageSize: 10, pagination: true, toolbar: '#loggerTool'">
    <thead>
    <tr>
        <th data-options="field:'taskId',align:'center'," width="5%">任务ID</th>
        <th data-options="field:'vin',align:'center'" width="10%">车辆VIN</th>
        <th data-options="field:'messageTag',align:'center',formatter:formatMessageTag" width="10%">消息ID/消息标识</th>
        <th data-options="field:'messageSequence',align:'center'" width="5%">消息序号</th>
        <th data-options="field:'applicationType',align:'center'" width="5%">消息类型</th>
        <th data-options="field:'message',align:'center'" width="65%">消息体</th>
    </tr>
    </thead>
</table>

<div id="loggerTool" style="height:auto">
    任务ID: <input class="easyui-textbox" id="taskId" style="width:110px">
    消息标识: <input class="easyui-textbox" id="messageTag" style="width:110px">
    车辆VIN: <input class="easyui-textbox" id="searchVin" style="width:110px">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true"
       onclick="reloadLoggerList()">查询</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"
       onclick="analysis()">分析</a>
    <a href="javascript:void(0)" class="easyui-linkbutton closeLog" data-options="iconCls:'icon-clear',plain:true"
       onclick="switchLogger(false)" style="display:none;float:right;">关闭日志</a>
    <a href="javascript:void(0)" class="easyui-linkbutton openLog" data-options="iconCls:'icon-save',plain:true"
       onclick="switchLogger(true)" style="display:none;float:right;">开启日志</a>
</div>

<div id="loggerDialog" class="easyui-dialog" title="分析结果" style="width:400px;height:200px;padding:10px"
     data-options="
				iconCls: 'icon-save',
				closed : true,
				buttons: [{
					text:'Cancel',
					iconCls:'icon-cancel',
					handler:function(){
						$('#loggerDialog').dialog('close');
					}
				}]
			">
</div>

<script type="text/javascript">
    $(function () {
        $(window).resize(function () {
            $('#loggerList').datagrid('resize', {
                width: $(window).width() - 90,
                height: $(window).height() - 150
            });
        });

        switchLogger();
    });

    function formatMessageTag(val, row, index) {
        return row.messageId ? row.messageId : row.uniqueCommandSeq;
    }

    function reloadLoggerList() {
        var taskId = $("#taskId").val();
        var vin = $("#searchVin").val();
        var messageId = null;
        var uniqueCommandSeq = null;
        if (isNaN($("#messageTag").val())) {
            uniqueCommandSeq = $("#messageTag").val();
        } else {
            messageId = $("#messageTag").val();
        }

        $("#loggerList").datagrid("reload", {
            taskId: taskId,
            vin: vin,
            messageId: messageId,
            uniqueCommandSeq: uniqueCommandSeq
        });
    }

    function switchLogger(isOpen) {
        $.post("${basePath}logger/switchLogger", {isOpen: isOpen}, function (data) {
            var jsonData = eval('(' + data + ')');
            if (jsonData.success) {
                if (jsonData.data == "true") {
                    $(".closeLog").show();
                    $(".openLog").hide();
                } else {
                    $(".closeLog").hide();
                    $(".openLog").show();
                }
            } else {
                alert(jsonData.errorMessage);
            }
        });
    }

    function analysis() {
        var taskId = $("#taskId").val();
        $.post("${basePath}logger/analysis", {taskId: taskId}, function (data) {
            $("#loggerDialog").html(data.replace("/\\\n/g", "<br/>"));
            $("#loggerDialog").dialog('open');
        });
    }
</script>
