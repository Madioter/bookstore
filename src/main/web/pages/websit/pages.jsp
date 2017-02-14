<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    body,div,ul,li,a,img{margin: 0;padding: 0;}
    ul,li{list-style: none;}
    a{text-decoration: none;}

    #wrapper{position: relative;padding-top: ${noticeBG.positionY}px;padding-left:${noticeBG.positionX}px;width: 400px;height: 200px;}
    #banner{position:relative;width: ${noticeBG.width}px;height: ${noticeBG.height}px;overflow: hidden;}
    .imgList{position:relative;width:2000px;height:200px;z-index: 10;overflow: hidden;}
    .imgList li{float:left;display: inline;}
    #prev,
    #next{position: absolute;top:80px;z-index: 20;cursor: pointer;opacity: 0.2;filter:alpha(opacity=20);}
    #prev{left: 10px;}
    #next{right: 10px;}
    #prev:hover,
    #next:hover{opacity: 0.5;filter:alpha(opacity=50);}
    .bg{position: absolute;bottom: 0;width: 400px;height: 40px;z-index:20;opacity: 0.4;filter:alpha(opacity=40);background: black;}
    .infoList{position: absolute;left: 10px;bottom: 10px;z-index: 30;}
    .infoList li{display: none;}
    .infoList .infoOn{display: inline;color: white;}
    .indexList{position: absolute;right: 10px;bottom: 5px;z-index: 30;}
    .indexList li{float: left;margin-right: 5px;padding: 2px 4px;border: 2px solid black;background: grey;cursor: pointer;}
    .indexList .indexOn{background: red;font-weight: bold;color: white;}
</style>
<div id="wrapper"><!-- 最外层部分 -->
    <div id="banner"><!-- 轮播部分 -->
        <ul class="imgList"><!-- 图片部分 -->
        <c:forEach items="${notices}" var="li">
            <li><a href="${li.link}"><img src="${basePath}${li.imgPath}" width="${width}px" height="${height}px" alt="${li.alt}"></a></li>
        </c:forEach>
        </ul>
        <img src="./img/prev.png" width="20px" height="40px" id="prev">
        <img src="./img/next.png" width="20px" height="40px" id="next">
        <div class="bg"></div> <!-- 图片底部背景层部分-->
        <ul class="infoList"><!-- 图片左下角文字信息部分 -->
            <c:forEach items="${notices}" var="li" varStatus="status">
                <li <c:if test="status.index == 0">class="infoOn"</c:if>>${li.title}</li>
            </c:forEach>
        </ul>
        <ul class="indexList"><!-- 图片右下角序号部分 -->
            <c:forEach items="${notices}" var="li" varStatus="status">
                <li <c:if test="status.index == 0">class="indexOn"</c:if>>${status.index + 1}</li>
            </c:forEach>
        </ul>
    </div>
</div>
<script type="text/javascript">
    var curIndex = 0, //当前index
        imgLen = $(".imgList li").length; //图片总数

    // 定时器自动变换2.5秒每次
    var autoChange = setInterval(function(){
        if(curIndex < imgLen-1){
            curIndex ++;
        }else{
            curIndex = 0;
        }
        //调用变换处理函数
        changeTo(curIndex);
    },2500);

    //左箭头滑入滑出事件处理
    $("#prev").hover(function(){
        //滑入清除定时器
        clearInterval(autoChange);
    },function(){
        //滑出则重置定时器
        autoChangeAgain();
    });
    //左箭头点击处理
    $("#prev").click(function(){
        //根据curIndex进行上一个图片处理
        curIndex = (curIndex > 0) ? (--curIndex) : (imgLen - 1);
        changeTo(curIndex);
    });

    //右箭头滑入滑出事件处理
    $("#next").hover(function(){
        //滑入清除定时器
        clearInterval(autoChange);
    },function(){
        //滑出则重置定时器
        autoChangeAgain();
    });
    //右箭头点击处理
    $("#next").click(function(){
        curIndex = (curIndex < imgLen - 1) ? (++curIndex) : 0;
        changeTo(curIndex);
    });

    //清除定时器时候的重置定时器--封装
    function autoChangeAgain(){
        autoChange = setInterval(function(){
            if(curIndex < imgLen-1){
                curIndex ++;
            }else{
                curIndex = 0;
            }
            //调用变换处理函数
            changeTo(curIndex);
        },2500);
    }

    function changeTo(num){
        var goLeft = num * ${noticeBG.width};
        $(".imgList").animate({left: "-" + goLeft + "px"},500);
        $(".infoList").find("li").removeClass("infoOn").eq(num).addClass("infoOn");
        $(".indexList").find("li").removeClass("indexOn").eq(num).addClass("indexOn");
    }

    //对右下角按钮index进行事件绑定处理等
    $(".indexList").find("li").each(function(item){
        $(this).hover(function(){
            clearInterval(autoChange);
            changeTo(item);
            curIndex = item;
        },function(){
            autoChangeAgain();
        });
    });


</script>