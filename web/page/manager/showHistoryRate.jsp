 <%-- 
    Document   : page3
    Created on : Dec 10, 2018, 11:03:45 AM
    Author     : Melnikov
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Столовая</title>
    </head>
    <body>
        <h1>Здесь вы можете посмотреть список проголосовавших</h1>
        ${info}<br>
        <a href="index">Главная страница</a><br>
        <form action="historyRate">
            <select name="day">
                <c:forEach var="day" begin="1" end="31" >
                    <option value="${day}">${day}</option>
                </c:forEach>
            </select>
            <select name="month">
                <c:forEach var="month" begin="1" end="12" >
                    <option value="${month}">${month}</option>
                </c:forEach>
            </select>
            <select name="year">
                <c:forEach var="year" begin="2018" end="2100" >
                    <option value="${year}">${year}</option>
                </c:forEach>
            </select>
            <input type="SUBMIT" value="На дату">
        </form>
        <ul>
            <c:forEach var="rateFood" items="${listRateFoods}">
                <li>${rateFood.user.student.name}, ${rateFood.user.student.surname}, <br> ${rateFood.rate}, ${rateFood.food.name}
            </c:forEach>
        </ul>
       
    </body>
</html>
