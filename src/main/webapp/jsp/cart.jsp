<%@ page import="static by.itclass.constants.AppConst.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Cart Page</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <jsp:include page="<%=MENU_JSP%>"/>
        <h2>Hello${user.name}</h2>
        <c:choose>
            <c:when test="${not empty orderItems}">
                <h2>Your cart:</h2>
                <c:forEach var="items=" items="${orderItems}">
                    <div class="cart-item">
                        <img class="cart-img" src="/img/${item.itemType eq 1 ? 'tv' : 'laptop'}/${item.vendor}-${item.model}.jpg">
                        <h3 class="cart-text">${item.vendor} ${item.model} by ${item.price} byn.</h3>
                        <form method="post" action="<%=CART_CONTROLLER%>">
                            <input type="hidden" name="<%=CART_ACTION_PARAM%>" value="remove">
                            <input type="hidden" name="<%=ITEM_TYPE_PARAM%>" value="${item.itemType}">
                            <input type="hidden" name="<%=ITEM_ID_PARAM%>" value="${item.itemId}">
                            <input type="hidden" name="<%=ITEM_PRICE_PARAM%>" value="${item.itemPrice}">
                            <input type="hidden" name="<%=QUANTITY_PARAM%>" value="${item.quantity}">
                            <input type="submit" value="you want too much">
                        </form>
<%--                        <form method="post" action="<%=CART_CONTROLLER%>">--%>
<%--                            <input type="hidden" name="<%=CART_ACTION_PARAM%>" value="decease">--%>
<%--                            <input type="hidden" name="<%=ITEM_TYPE_PARAM%>" value="${item.itemType}">--%>
<%--                            <input type="hidden" name="<%=ITEM_ID_PARAM%>" value="${item.itemId}">--%>
<%--                            <input type="hidden" name="<%=ITEM_PRICE_PARAM%>" value="${item.itemPrice}">--%>
<%--                            <input type="hidden" name="<%=QUANTITY_PARAM%>" value="${item.quantity}">--%>
<%--                            <input type="shange-number" value="-">--%>
<%--                        </form>--%>
<%--                        <form method="post" action="<%=CART_CONTROLLER%>">--%>
<%--                            <input type="hidden" name="<%=CART_ACTION_PARAM%>" value="increase">--%>
<%--                            <input type="hidden" name="<%=ITEM_TYPE_PARAM%>" value="${item.itemType}">--%>
<%--                            <input type="hidden" name="<%=ITEM_ID_PARAM%>" value="${item.itemId}">--%>
<%--                            <input type="hidden" name="<%=ITEM_PRICE_PARAM%>" value="${item.itemPrice}">--%>
<%--                            <input type="hidden" name="<%=QUANTITY_PARAM%>" value="${item.quantity}">--%>
<%--                            <input type="shange-number" value="+">--%>
<%--                        </form>--%>
                        <form method="post" action="<%=CART_CONTROLLER%>">
                            <input type="hidden" name="<%=CART_ACTION_PARAM%>" value="decease">
                            <input type="hidden" name="<%=ITEM_TYPE_PARAM%>" value="${item.itemType}">
                            <input type="hidden" name="<%=ITEM_ID_PARAM%>" value="${item.itemId}">
                            <div class="number-input">
                                <button onclick="this.parentNode.querySelector('input [type=number]')."></button>

                                <inpyt type="number" name="<%=QUANTITY_PARAM%>" valu="${item.quantity}" min="1"
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p>Your cart is empty</p>
            </c:otherwise>
        </c:choose>

</body>
</html>
