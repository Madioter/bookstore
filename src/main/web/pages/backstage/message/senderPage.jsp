<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="easyui-panel" title="请求发送测试" style="width:100%;padding:20px 30px;">
    <div data-options="region:'center',title:''">
        <div class="easyui-tabs" data-options="fit:true,border:false,plain:true" style="height:700px">
            <div id="tcpSender" title="TCP消息发送" data-options="closable: false">
                通过VIN和消息内容，直接发送TCP消息（做单次问题数据发送测试）
                不提供模板，由出问题的TCP指令直接粘贴上来发送，可以提供响应结果的解析
                待做
            </div>
            <div id="httpSender" title="HTTP指令下达" data-options="closable: false">
                <div style="text-align:left;padding:0px 0;margin-bottom:20px;">
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="sendHttpRequest()"
                       style="width:80px">发送数据</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearHttpRequest()"
                       style="width:80px">清空</a>
                </div>
                <form id="httpForm" method="post">
                    <div style="width:50%; float:left;">
                        <div style="margin-bottom:20px;">
                            <select class="easyui-combobox applicationType"
                                    data-options="label:'业务类型:',panelHeight:'auto',width:'50%'">
                                <c:forEach var="type" items="${cmdApplicationTypes}">
                                    <option value="${type.code}">
                                            ${type.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" style="width:80%;" labelPosition="left"
                                   data-options="label:'url:'">
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" style="width:80%;height:300px" labelPosition="left"
                                   data-options="label:'参数:',multiline:true">
                        </div>
                    </div>
                    <div style="width:50%;float:right;">
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" style="width:90%;height:100px" labelPosition="top"
                                   data-options="label:'响应1:',multiline:true">
                            <input class="easyui-textbox" style="width:90%;height:100px" labelPosition="top"
                                   data-options="label:'响应2:',multiline:true">
                            <input class="easyui-textbox" style="width:90%;height:100px" labelPosition="top"
                                   data-options="label:'响应3:',multiline:true">
                            <input class="easyui-textbox" style="width:90%;height:100px" labelPosition="top"
                                   data-options="label:'响应4:',multiline:true">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

</script>
