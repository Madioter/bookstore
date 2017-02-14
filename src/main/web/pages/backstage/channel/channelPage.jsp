<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<table class="easyui-datagrid" id="channelList"
       data-options="url:'${basePath}channel/channelList?random=' + new Date().getTime(),method:'get',singleSelect:false,fit:false,
       width: $(window).width() - 90, height: $(window).height() - 150,
       fitColumns:true,nowrap: false, rownumbers: true, pageSize: 10, pagination: true, toolbar: '#channelTool'">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'accessTokenId',align:'center'," width="20%">身份标识</th>
        <th data-options="field:'vin',align:'center'" width="15%">车辆VIN</th>
        <th data-options="field:'localAddress',align:'center'" width="15%">客户端IP</th>
        <th data-options="field:'status',align:'center'" width="10%">状态</th>
        <th data-options="field:'converterType',align:'center'" width="25%">编码类型</th>
        <th data-options="field:'expireTime',align:'center'" width="15%">有效期</th>
    </tr>
    </thead>
</table>

<div id="channelTool" style="height:auto">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"
       onclick="addChannel()">新增通道</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"
       onclick="removeChannel()">关闭通道</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"
       onclick="chooseChannel()">关闭选择通道</a>

    <div style="float:right;">
        <input name="showError" type="checkbox" onclick="reloadChannelList()">只显示异常
    </div>
</div>

<div id="chooseChannelDialog" class="easyui-dialog" title="关闭通道选择" style="width:400px;height:200px;padding:10px"
     data-options="
				iconCls: 'icon-save',
				closed : true,
				buttons: [{
					text:'Ok',
					iconCls:'icon-ok',
					handler:function(){
						closeChannel();
					}
				},{
					text:'Cancel',
					iconCls:'icon-cancel',
					handler:function(){
						$('#chooseChannelDialog').dialog('close');
					}
				}]
			">
    <form>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="startVin" style="width: 350px; "
                   data-options="label:'起始VIN:'">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="endVin" style="width: 350px; "
                   data-options="label:'结束VIN:'">
        </div>
    </form>
</div>

<div id="addChannelDialog" class="easyui-dialog" title="新增通道" style="width:400px;height:200px;padding:10px"
     data-options="
				iconCls: 'icon-save',
				closed : true,
				buttons: [{
					text:'Ok',
					iconCls:'icon-ok',
					handler:function(){
						startChannel();
					}
				},{
					text:'Cancel',
					iconCls:'icon-cancel',
					handler:function(){
						$('#addChannelDialog').dialog('close');
					}
				}]
			">
    <form>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="channelCount" style="width: 350px; "
                   data-options="label:'启动的数目:'">
        </div>
        <div style="margin-bottom:20px">
            <select class="easyui-combobox" id="converterType" label="编码类型:" labelPosition="left"
                    data-options="panelHeight:'auto'" style="width: 350px;">
                <option value="PROTOCAL_BUFFER">PROTOBUF编码</option>
                <option value="BINARY_NOTES_ASN_PER_UNALIGNED">Binary Notes的ASN.1 PER-U编码</option>
                <option value="OBJECTIVE_SYSTEM_ASN_ALIGN">Objective System的ASN.1 PER-A编码</option>
                <option value="JAC_ASN_BER">JAC的ASN.1 BER编码</option>
            </select>
        </div>
    </form>
</div>

<script type="text/javascript">
    $(function () {
        $(window).resize(function () {
            $('#channelList').datagrid('resize', {
                width: $(window).width() - 90,
                height: $(window).height() - 150
            });
        });
    });

    function reloadChannelList() {
        $('#channelList').datagrid('reload', {
            showError: $('input[name="showError"]:checked').length > 0, curtime: new Date().getTime()
        });
    }

    function addChannel() {
        $('#addChannelDialog').dialog('open');
    }

    function startChannel() {
        $.post("${basePath}channel/start", {
            count: $("#channelCount").val(),
            converterType: $("#converterType").combobox('getValue')
        }, function (data) {
            var jsonData = eval('(' + data + ')');
            if (jsonData.success) {
                alert("启动通道成功");
                $('#addChannelDialog').dialog('close');
                reloadChannelList();
            } else {
                alert(jsonData.errorMessage);
            }
        });
    }

    function removeChannel() {
        var selRows = $('#channelList').datagrid('getChecked');
        var vins = [];
        if (selRows) {
            for (var i = 0; i < selRows.length; i++) {
                vins[i] = selRows[i].vin;
            }
        } else {
            alert("请选择需要删除的通道");
            return;
        }
        $.post("${basePath}channel/stopVins", {vins: vins.join(",")}, function (data) {
            var jsonData = eval('(' + data + ')');
            if (jsonData.success) {
                alert("成功关闭通道：" + jsonData.data + "个");
                reloadChannelList();
            } else {
                alert(jsonData.errorMessage);
            }
        });
    }

    function chooseChannel() {
        $('#chooseChannelDialog').dialog('open');
    }

    function closeChannel() {
        $.post("${basePath}channel/stopIndex", {
            startVin: $("#startVin").textbox('getValue'),
            endVin: $("#endVin").textbox('getValue')
        }, function (data) {
            var jsonData = eval('(' + data + ')');
            if (jsonData.success) {
                alert("成功关闭通道：" + jsonData.data + "个");
                $('#chooseChannelDialog').dialog('close');
                reloadChannelList();
            } else {
                alert(jsonData.errorMessage);
            }
        });
    }
</script>