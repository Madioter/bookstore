<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="templatemo_content_right">
    <c:forEach var="${recommendedBooks}" items="book" varStatus="status">
        <div class="templatemo_product_box">
            <h1>${book.title} <span>(${book.author})</span></h1>
            <img src="${path}/book/cover?images=${book.coverPath}" alt="image"/>
            <div class="product_info">
                <p>${book.description}...</p>
                <h3>${book.cost}</h3>
                <div class="buy_now_button"><a href="paypge(${book.id})">Buy Now</a></div>
                <div class="detail_button"><a href="subpage(${book.id})">Detail</a></div>
            </div>
            <div class="cleaner">&nbsp;</div>
        </div>

        <if test="status.index % 2 == 0">
            <div class="cleaner_with_width">&nbsp;</div>
        </if>
        <if test="status.index %2 == 1">
            <div class="cleaner_with_height">&nbsp;</div>
        </if>
    </c:forEach>

    <a href="subpage.html"><img src="images/templatemo_ads.jpg" alt="ads"/></a>
</div>
<!-- end of content right -->
