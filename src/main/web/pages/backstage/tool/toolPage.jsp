<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="easyui-panel" title="请求信息转换工具" style="width:100%;padding:20px 30px;">
    <div style="text-align:left;padding:0px 0;margin-bottom:20px;">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="encode()" style="width:80px">生成数据</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="decode()" style="width:80px">解析数据</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearData()" style="width:80px">清空数据</a>
    </div>
    <form id="codec" method="post">
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
    function encode() {
        var data = $("#codec .data").textbox('getValue');
        var body = $("#codec .body").textbox('getValue');
        var applicationType = $("#codec .applicationType").combobox('getValue');
        var converterType = $("#codec .converterType").combobox('getValue');
        $.post("${basePath}tool/encode", {
            data: data,
            body: body,
            applicationType: applicationType,
            converterType: converterType
        }, function (data) {
            var jsonData = eval("(" + data + ")");
            $("#codec .header").textbox('setValue', jsonData["header"]);
            $("#codec .body").textbox('setValue', jsonData["body"]);
            $("#codec .hexCode").textbox('setValue', jsonData["hexCode"]);
            $("#codec .data").textbox('setValue', jsonData["data"]);
            swapHexCode();
        });
    }

    function decode() {
        swapHexCode();
        var hexCode = $("#codec .hexCode").val();
        $.post("${basePath}tool/decode", {hexCode: hexCode}, function (data) {
            var jsonData = eval("(" + data + ")");
            $("#codec .header").textbox('setValue', jsonData["header"]);
            $("#codec .body").textbox('setValue', jsonData["body"]);
            $("#codec .data").textbox('setValue', jsonData["data"]);
        });
    }

    function clearData() {
        $("#codec .header").textbox('clear');
        $("#codec .body").textbox('clear');
        $("#codec .hexCode").textbox('clear');
        $("#codec .data").textbox('clear');
        $("#codec .hexCodeSwap").textbox('clear');
    }

    function swapHexCode() {
        var hexCode = $("#codec .hexCode").textbox('getValue');
        var hexCodeSwap = $("#codec .hexCodeSwap").textbox('getValue');
        if (hexCode) {
            var hexCodeSwaps = [];
            for (var i = 1; i < hexCode.length; i = i + 2) {
                hexCodeSwaps[(i - 1) / 2] = "\\x" + hexCode[i - 1] + hexCode[i];
            }
            $("#codec .hexCodeSwap").textbox('setValue', "\"" + hexCodeSwaps.join("") + "\"");
        } else if (!hexCode && hexCodeSwap) {
            hexCode = hexCodeSwap.replaceAll("\\x", "");
            $("#codec .hexCode").textbox('setValue', hexCode);
        } else if (!hexCode && !hexCodeSwap) {
            return;
        }
    }
</script>
