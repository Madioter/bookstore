<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="templatemo_content_right">
    <c:forEach var="book" items="${recommendedBooks}" varStatus="status">
        <div class="templatemo_product_box">
            <h1>${book.title} <span>(${book.author})</span></h1>
            <img src="${basePath}${book.coverPath}" alt="image"/>
            <div class="product_info">
                <div style="height: 100px;">
                <p>${book.description}</p>
                </div>
                <h3>售卖价：${book.cost}</h3>
                <div class="buy_now_button" style="float: left;padding-right:20px;"><a href="paypge(${book.id})">Buy
                    Now</a></div>
                <div class="detail_button" style="float: left;"><a href="subpage(${book.id})">Detail</a></div>
            </div>
            <div class="cleaner">&nbsp;</div>
        </div>

        <c:if test="status.index % 2 == 0">
            <div class="cleaner_with_width">&nbsp;</div>
        </c:if>
        <c:if test="status.index % 2 == 1">
            <div class="cleaner_with_height">&nbsp;</div>
        </c:if>
    </c:forEach>

</div>
<!-- end of content right -->
