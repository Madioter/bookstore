<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<table class="easyui-datagrid" id="bookList"
       data-options="url:'${basePath}book/bookList', method:'get', singleSelect:false, fit:false,
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

<div id="bookTb" style="height:auto">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"
       onclick="createBook()">新增</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"
       onclick="editBook()">修改</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true"
       onclick="deleteBook()">删除</a>
</div>

<div id="modifyBook" class="easyui-dialog" title="编辑书籍" style="width:100%;height:200px;padding:10px"
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
        <input class="id" name="id" name="" type="hidden">
        <div style="margin-bottom:20px;float:left;width:50%;">
            <select class="easyui-combobox applicationType"
                    data-options="label:'业务类型:',panelHeight:'auto',width:'50%'">
                <c:forEach var="type" items="${applicationTypes}">
                    <option name="${type.code}">
                            ${type.name}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div style="margin-bottom:20px;float:right;width:50%;">
            <select class="easyui-combobox converterType"
                    data-options="label:'编码类型:',panelHeight:'auto',width:'50%'">
                <c:forEach var="type" items="${converterTypes}">
                    <option name="${type.code}">
                            ${type.name}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div style="width:50%;float:left;">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox header" style="width:90%;height:100px" labelPosition="top"
                       data-options="label:'dispatcher header:',multiline:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox body" style="width:90%;height:100px" labelPosition="top"
                       data-options="label:'dispatcher body:',multiline:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox data" style="width:90%;height:200px" labelPosition="top"
                       data-options="label:'application data:',multiline:true">
            </div>
        </div>
        <div style="width:50%;float:right;">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox hexCode" style="width:90%;height:150px" labelPosition="top"
                       data-options="label:'十六进制数据:',multiline:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox hexCodeSwap" style="width:90%;height:250px" labelPosition="top"
                       data-options="label:'十六进制数据格式转换:',multiline:true">
            </div>
        </div>
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

    function createBook() {
        $('#modifyBook').dialog('open');
    }

    function editBook() {
        var row = $('#bookList').datagrid('getSelected');
        if (row) {

            $('#modifyBook').dialog('open');
        } else {
            alert("请选择需要修改的书籍");
        }
    }

    function modifyBook() {


        $.post("${basePath}book/saveBook", obj, function (data) {
            var jsonData = eval('(' + data + ')');
            if (jsonData.success) {
                alert("保存成功");
                $('#modifyBook').dialog('close');
                $("#bookList").datagrid("reload", {});
            } else {
                alert(jsonData.errorMessage);
            }
        });
    }

    function deleteBook() {
        var selRows = $('#bookList').datagrid('getChecked');
        var ids = [];
        if (selRows) {
            for (var i = 0; i < selRows.length; i++) {
                ids[i] = selRows[i].id;
            }
        } else {
            alert("请选择需要删除的书籍");
            return;
        }

        $.post("${basePath}book/deleteBook", {bookIds: ids.join(",")}, function (data) {
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
