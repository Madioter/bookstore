<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="templatemo_content_left">
    <div class="templatemo_content_left_section">
        <h1>热销书籍</h1>
        <ul>
            <c:forEach items="${bestSaleBooks}" var="book">
                <li><a href="${book.link}" target="_blank">${book.title}</a></li>
            </c:forEach>
        </ul>
    </div>
    <div class="templatemo_content_left_section">
        <h1>新书快递</h1>
        <ul>
            <c:forEach items="${newBooks}" var="book">
                <li><a href="${book.link}" target="_blank">${book.title}</a></li>
            </c:forEach>
        </ul>
    </div>

    <div class="templatemo_content_left_section">
        <a href="http://validator.w3.org/check?uri=referer"><img style="border:0;width:88px;height:31px" src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Transitional" width="88" height="31" vspace="8" border="0" /></a>
        <a href="http://jigsaw.w3.org/css-validator/check/referer"><img style="border:0;width:88px;height:31px"  src="http://jigsaw.w3.org/css-validator/images/vcss-blue" alt="Valid CSS!" vspace="8" border="0" /></a>
    </div>
</div> <!-- end of content left -->

<script type="text/javascript">
    function subpage(id) {
        $.post("${path}/book/subPage",{id:id},function(data) {
            $("#templatemo_content_right").html(data);
        });
    }
</script>