<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<table class="easyui-datagrid" id="bookList"
       data-options="url:'${basePath}book/book-list', method:'get', singleSelect:false, fit:false,
              width: $(window).width() - 90, height: $(window).height() - 150,
       fitColumns:true,nowrap: false, rownumbers: true, pageSize: 10, pagination: true, toolbar: '#bookTb'">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',align:'center'" width="4%">id</th>
        <th data-options="field:'title',align:'center'" width="30%">书名</th>
        <th data-options="field:'author',align:'center'" width="18%">作者</th>
        <th data-options="field:'publicationDate',align:'center'" width="14%">出版日期</th>
        <th data-options="field:'press',align:'center'" width="18%">出版社</th>
        <th data-options="field:'cost',align:'center'" width="10%">售卖价</th>
        <th data-options="field:'isbn',align:'center'" width="10%">ISBN</th>
    </tr>
    </thead>
</table>

<div id="taskTb" style="height:auto">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"
       onclick="createBook()">新增</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"
       onclick="editBook()">修改</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true"
       onclick="deleteBook()">删除任务</a>
</div>

<div id="modifyBook" class="easyui-dialog" title="编辑书籍" style="width:400px;height:200px;padding:10px"
     data-options="
				iconCls: 'icon-save',
				closed : true,
				buttons: [{
					text:'Ok',
					iconCls:'icon-ok',
					handler:function(){
						modifyBook();
					}
				},{
					text:'Cancel',
					iconCls:'icon-cancel',
					handler:function(){
						$('#modifyBook').dialog('close');
					}
				}]
			">
    <form class="book-form">
        <input class="id" name="id" value="" type="hidden">

    </form>
</div>

<script type="text/javascript">
    $(function () {
        $(window).resize(function () {
            $('#bookList').datagrid('resize', {
                width: $(window).width() - 90,
                height: $(window).height() - 150
            });
        });
    });

    function editBook() {
        var row = $('#bookList').datagrid('getSelected');
        if (row) {
            var $addTask = $('<form><input name="taskId" value="' + row.id + '" type="hidden">' +
            '<input name="processId" value="' + row.processId + '" type="hidden"></form>');
            for (var i = 0; i < paramsDef.length; i++) {
                var code = paramsDef[i].code;
                var label = paramsDef[i].name;
                var value = params[code];
                var $input = $('<div style="margin-bottom:10px"><label width="20%">' + label + ': </label><input class="easyui-textbox" type="text"' +
                'name="' + code + '" value="' + value + '" style="width: 220px; float: right"></div>');
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
            obj[$inputs[i].name] = $inputs[i].value;
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
