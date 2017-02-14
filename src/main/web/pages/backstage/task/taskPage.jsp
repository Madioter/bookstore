<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<table class="easyui-datagrid" id="taskList"
       data-options="url:'${basePath}task/taskList?random=' + new Date().getTime(), method:'get', singleSelect:false, fit:false,
              width: $(window).width() - 90, height: $(window).height() - 150,
       fitColumns:true,nowrap: false, rownumbers: true, pageSize: 10, pagination: true, toolbar: '#taskTb'">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',align:'center'" width="4%">id</th>
        <th data-options="field:'processName',align:'center'" width="7%">流程名称</th>
        <th data-options="field:'addTime',align:'center'" width="12%">创建时间</th>
        <th data-options="field:'startTime',align:'center'" width="12%">启动时间</th>
        <th data-options="field:'finishTime',align:'center'" width="12%">结束时间</th>
        <th data-options="field:'params',align:'center'" width="22%">参数配置</th>
        <th data-options="field:'error',align:'center'" width="25%">消息</th>
        <th data-options="field:'status',align:'center'" width="6%">状态</th>
    </tr>
    </thead>
</table>

<div id="taskTb" style="height:auto">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"
       onclick="startTask()">启动任务</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"
       onclick="editTask()">修改任务</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"
       onclick="stopTask()">停止任务</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true"
       onclick="deleteTask()">删除任务</a>
</div>

<div id="modifyTask" class="easyui-dialog" title="修改任务" style="width:400px;height:200px;padding:10px"
     data-options="
				iconCls: 'icon-save',
				closed : true,
				buttons: [{
					text:'Ok',
					iconCls:'icon-ok',
					handler:function(){
						modifyTask();
					}
				},{
					text:'Cancel',
					iconCls:'icon-cancel',
					handler:function(){
						$('#modifyTask').dialog('close');
					}
				}]
			">
</div>

<script type="text/javascript">
    $(function () {
        $(window).resize(function () {
            $('#taskList').datagrid('resize', {
                width: $(window).width() - 90,
                height: $(window).height() - 150
            });
        });
    });

    function editTask() {
        var row = $('#taskList').datagrid('getSelected');
        if (row) {
            var paramsDef = eval('(' + row.paramsDef + ')');
            var params = eval('(' + row.params + ')');
            var $addTask = $('<form><input name="taskId" name="' + row.id + '" type="hidden">' +
            '<input name="processId" name="' + row.processId + '" type="hidden"></form>');
            for (var i = 0; i < paramsDef.length; i++) {
                var code = paramsDef[i].code;
                var label = paramsDef[i].name;
                var name = params[code];
                var $input = $('<div style="margin-bottom:10px"><label width="20%">' + label + ': </label><input class="easyui-textbox" type="text"' +
                'name="' + code + '" name="' + name + '" style="width: 220px; float: right"></div>');
                $addTask.append($input);
            }
            $('#modifyTask').html($addTask);
            $('#modifyTask').dialog('open');
        } else {
            alert("请选择需要修改的任务");
        }
    }

    function modifyTask() {
        var $inputs = $("#modifyTask input");
        var obj = {};
        for (var i = 0; i < $inputs.size(); i++) {
            obj[$inputs[i].name] = $inputs[i].name;
        }
        $.post("${basePath}task/saveTask", obj, function (data) {
            var jsonData = eval('(' + data + ')');
            if (jsonData.success) {
                alert("任务保存成功");
                $('#modifyTask').dialog('close');
                $("#taskList").datagrid("reload", {});
            } else {
                alert(jsonData.errorMessage);
            }
        });
    }

    function startTask() {
        var row = $('#taskList').datagrid('getSelected');
        if (row) {
            $.post("${basePath}task/startTask", {taskId: row.id}, function (data) {
                var jsonData = eval('(' + data + ')');
                if (jsonData.success) {
                    alert("启动任务成功");
                    $("#taskList").datagrid("reload", {});
                } else {
                    alert(jsonData.errorMessage);
                }
            });
        } else {
            alert("请选择需要启动的任务");
        }
    }

    function stopTask() {
        var row = $('#taskList').datagrid('getSelected');
        if (row) {
            $.post("${basePath}task/stopTask", {taskId: row.id}, function (data) {
                var jsonData = eval('(' + data + ')');
                if (jsonData.success) {
                    alert("停止任务成功");
                    $("#taskList").datagrid("reload", {});
                } else {
                    alert(jsonData.errorMessage);
                }
            });
        } else {
            alert("请选择需要停止的任务");
        }
    }

    function deleteTask() {
        var selRows = $('#taskList').datagrid('getChecked');
        var ids = [];
        if (selRows) {
            for (var i = 0; i < selRows.length; i++) {
                ids[i] = selRows[i].id;
            }
        } else {
            alert("请选择需要删除的任务");
            return;
        }

        $.post("${basePath}task/deleteTask", {taskIds: ids.join(",")}, function (data) {
            var jsonData = eval('(' + data + ')');
            if (jsonData.success) {
                alert("删除任务成功");
                $("#taskList").datagrid("reload", {});
            } else {
                alert(jsonData.errorMessage);
            }
        });

    }
</script>
