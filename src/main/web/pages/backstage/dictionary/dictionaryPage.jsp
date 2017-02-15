<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div id="dictionaryTb" style="height:auto">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"
       onclick="createDictionary()">新增</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"
       onclick="editDictionary()">修改</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true"
       onclick="deleteDictionary()">删除</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true"
       onclick="refreshDictionary()">刷新</a>
</div>
<table id="dictionaryList" class="easyui-treegrid"
       data-options="
				iconCls: 'icon-ok',
				rownumbers: true,
				animate: true,
				collapsible: true,
				fitColumns: true,
				url:'${basePath}dictionary/dictionaryList',
				method: 'get',
				idField: 'id',
				treeField: 'text',
				width: $(window).width() - 90,
				height: $(window).height() - 150,
				toolbar: '#dictionaryTb'
			">
    <thead>
    <tr>
        <th data-options="field:'text'" width="40%">名称</th>
        <th data-options="field:'code'" width="20%">编码</th>
        <th data-options="field:'parentId'" width="20%">父级ID</th>
    </tr>
    </thead>
</table>

<div id="modifyDictionary" class="easyui-dialog" title="编辑字典" style="width:450px;height:200px;padding:10px"
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

        <div style="margin-bottom:10px">
            <input class="easyui-combotree parentId" style="width:350px;"
                   data-options="url:'${basePath}dictionary/getTree',method:'get',label:'父节点:'"/>
        </div>
        <div style="margin-bottom:10px">
            <input class="easyui-textbox text" style="width: 350px; "
                   data-options="label:'名称:'"/>
        </div>
        <div style="margin-bottom:10px">
            <input class="easyui-textbox code" style="width: 350px; "
                   data-options="label:'编码:'"/>
        </div>
    </form>
</div>

<script type="text/javascript">
    $(function () {
        $(window).resize(function () {
            $('#dictionaryList').treegrid('resize', {
                width: $(window).width() - 90,
                height: $(window).height() - 150
            });
        });
    });

    function editDictionary() {
        var row = $('#dictionaryList').treegrid('getSelected');
        if (row) {
            $(".dictionary-form .id").val(row.id);
            $(".dictionary-form .parentId").combotree("setValue", row.parentId);
            $(".dictionary-form .text").textbox("setValue", row.text);
            $(".dictionary-form .code").textbox("setValue", row.code);
            $('#modifyDictionary').dialog('open');
        } else {
            alert("请选择需要修改的类型");
        }
    }

    function modifyDictionary() {
        var id = $(".dictionary-form .id").val();
        var parentId = $(".dictionary-form .parentId").combotree("getValue");
        var text = $(".dictionary-form .text").textbox("getValue");
        var code = $(".dictionary-form .code").textbox("getValue");
        $.post("${basePath}dictionary/saveDictionary", {
            id: id,
            parentId: parentId,
            text: text,
            code: code
        }, function (data) {
            var jsonData = eval('(' + data + ')');
            if (jsonData.success) {
                alert("保存成功");
                $('#modifyDictionary').dialog('close');
            } else {
                alert(jsonData.errorMessage);
            }
        });
    }

    function createDictionary() {
        var row = $('#dictionaryList').treegrid('getSelected');
        if (row) {
            var parentId = row.id;
        }
        $(".dictionary-form .id").val("");
        $(".dictionary-form .parentId").combotree("setValue", parentId);
        $(".dictionary-form .text").textbox("setValue", "");
        $(".dictionary-form .code").textbox("setValue", "");
        $('#modifyDictionary').dialog('open');
    }

    function refreshDictionary() {
        $.post("${basePath}dictionary/refreshDictionary", {}, function (data) {
            $("#dictionaryList").treegrid("reload", {});
            $(".dictionary-form .parentId").combotree("reload");
        });
    }

    function deleteDictionary() {
        var row = $('#dictionaryList').treegrid('getSelected');
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
            } else {
                alert(jsonData.errorMessage);
            }
        });
    }
</script>
