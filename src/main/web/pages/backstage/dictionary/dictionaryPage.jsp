<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<script type="text/javascript" src="${basePath}resources/js/treegrid_extend.js"></script>
<div id="dictionaryTb" style="height:auto">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"
       onclick="createDictionary()">新增</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"
       onclick="editDictionary()">修改</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true"
       onclick="deleteDictionary()">删除任务</a>
</div>
<table id="dictionaryList"
       data-options="
				iconCls: 'icon-ok',
				rownumbers: true,
				animate: true,
				collapsible: true,
				fitColumns: true,
				url:'${basePath}dictionary/dictionary-list',
				method: 'get',
				idField: 'id',
				treeField: 'value',
				pagination: true,
				rownumbers: true, pageSize: 10,
				width: $(window).width() - 90, height: $(window).height() - 150,
				toolbar: '#dictionaryTb'
			">
    <thead>
    <tr>
        <th data-options="field:'value',width:40%">值</th>
        <th data-options="field:'code',width:20%">编码</th>
        <th data-options="field:'parentId',width:20%">父级ID</th>
    </tr>
    </thead>
</table>

<div id="modifyDictionary" class="easyui-dialog" title="编辑字典" style="width:400px;height:200px;padding:10px"
     data-options="
				iconCls: 'icon-save',
				closed : true,
				buttons: [{
					text:'Ok',
					iconCls:'icon-ok',
					handler:function(){
						modifyDictionary();
					}
				},{
					text:'Cancel',
					iconCls:'icon-cancel',
					handler:function(){
						$('#modifyDictionary').dialog('close');
					}
				}]
			">
    <form class="dictionary-form">
        <input class="id" name="id" type="hidden">

        <div style="margin-bottom:20px">
            <input class="easyui-combotree parentId" style="width:350px;"
                   data-options="url:'${basePath}dictionary/getTree',method:'get',label:'父节点:'"/>
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox value" style="width: 350px; "
                   data-options="label:'值:'"/>
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox code" style="width: 350px; "
                   data-options="label:'编码:'"/>
        </div>
    </form>
</div>

<script type="text/javascript">
    $(function () {
        $(window).resize(function () {
            $('#dictionaryList').datagrid('resize', {
                width: $(window).width() - 90,
                height: $(window).height() - 150
            });
        });
    });

    function editDictionary() {
        var row = $('#dictionaryList').datagrid('getSelected');
        if (row) {
            $(".dictionary-form .id").val(row.id);
            $(".dictionary-form .parentId").combotree("setValue", row.parentId);
            $(".dictionary-form .value").combotree("setValue", row.value);
            $(".dictionary-form .code").combotree("setValue", row.code);
            $('#modifyDictionary').dialog('open');
        } else {
            alert("请选择需要修改的类型");
        }
    }

    function modifyDictionary() {
        var id = $(".dictionary-form .id").val();
        var parentId = $(".dictionary-form .parentId").combotree("getValue");
        var value = $(".dictionary-form .value").combotree("getValue");
        var code = $(".dictionary-form .code").combotree("getValue");
        $.post("${basePath}dictionary/saveDictionary", {
            id: id,
            parentId: parentId,
            value: value,
            code: code
        }, function (data) {
            var jsonData = eval('(' + data + ')');
            if (jsonData.success) {
                alert("任务保存成功");
                $('#modifyDictionary').dialog('close');
                $("#dictionaryList").datagrid("reload", {});
            } else {
                alert(jsonData.errorMessage);
            }
        });
    }

    function createDictionary() {
        $(".dictionary-form .id").val("");
        $(".dictionary-form .parentId").combotree("setValue", "");
        $(".dictionary-form .value").combotree("setValue", "");
        $(".dictionary-form .code").combotree("setValue", "");
        $('#modifyDictionary').dialog('open');
    }

    function deleteDictionary() {
        var row = $('#dictionaryList').datagrid('getChecked');
        if (row) {
            var id = row.id;
        } else {
            alert("请选择需要删除的节点");
            return;
        }

        $.post("${basePath}dictionary/deleteDictionary", {id: id}, function (data) {
            var jsonData = eval('(' + data + ')');
            if (jsonData.success) {
                alert("删除成功");
                $("#dictionaryList").datagrid("reload", {});
            } else {
                alert(jsonData.errorMessage);
            }
        });

    }
</script>
