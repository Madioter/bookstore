<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<table class="easyui-datagrid" id="processList"
       data-options="url:'${basePath}process/processList',method:'get',singleSelect:true,fit:false,
       width: $(window).width() - 90, height: $(window).height() - 120,
       fitColumns:true,nowrap: false, rownumbers: true, pageSize: 10, pagination: true, toolbar: '#tb'">
    <thead>
    <tr>
        <th data-options="field:'id'" hidden>id</th>
        <th data-options="field:'name',align:'center'," width="12%">名称</th>
        <th data-options="field:'version',align:'center'" width="8%">版本</th>
        <th data-options="field:'className',align:'center'" width="20%">类名</th>
        <th data-options="field:'description',align:'center'" width="60%">说明</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height:auto">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"
       onclick="addTask()">新增任务</a>
</div>

<div id="addTaskDialog" class="easyui-dialog" title="新增任务" style="width:400px;height:200px;padding:10px"
     data-options="
				iconCls: 'icon-save',
				closed : true,
				buttons: [{
					text:'Ok',
					iconCls:'icon-ok',
					handler:function(){
						saveTask();
					}
				},{
					text:'Cancel',
                  iconCls:'icon-cancel',
					handler:function(){
						$('#addTaskDialog').dialog('close');
					}
				}]
			">
</div>

<script type="text/javascript">
    $(function () {
        $(window).resize(function () {
            $('#processList').datagrid('resize', {
                width: $(window).width() - 90,
                height: $(window).height() - 150
            });
        });
    });

    function addTask() {
        var row = $('#processList').datagrid('getSelected');
        if (row) {
            var paramsDef = eval('(' + row.paramsDef + ')');
            var $addTask = $('<form><input name="processId" name="' + row.id + '" type="hidden"></form>');
            for (var i = 0; i < paramsDef.length; i++) {
                var code = paramsDef[i].code;
                var name = paramsDef[i].name;
                var defaultValue = paramsDef[i].defaultValue;
                var $input = $('<div style="margin-bottom:10px"><label>' + name + ': </label><input class="easyui-textbox" type="text"' +
                'name="' + code + '" name="' + defaultValue + '" style="width: 220px; float: right"></div>');
                $addTask.append($input);
            }
            $('#addTaskDialog').html($addTask);
            $('#addTaskDialog').dialog('open');
        } else {
            alert("请先选择流程");
        }
    }

    function saveTask() {
        var $inputs = $("#addTaskDialog input");
        var obj = {};
        for (var i = 0; i < $inputs.size(); i++) {
            obj[$inputs[i].name] = $inputs[i].name;
        }
        $.post("${basePath}task/saveTask", obj, function (data) {
            var jsonData = eval('(' + data + ')');
            if (jsonData.success) {
                alert("任务保存成功");
                $('#addTaskDialog').dialog('close');
            } else {
                alert(jsonData.errorMessage);
            }
        });
    }
</script>