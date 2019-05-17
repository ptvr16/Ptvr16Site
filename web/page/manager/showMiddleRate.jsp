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
        <h1>Здесь вы можете посмотреть средний балл оценок</h1>
        ${info}<br>
        <a href="showHistoryRate">Вернуться к списку проголосовавших</a><br>
        <form action="middleRate">
            <select name="foodId">
                <c:forEach var="food" items="${listFoods}">
                    <option value="${food.id}">${food.name}</option>
                </c:forEach>
            </select>
            
            <input type="SUBMIT" value="На оценку">
        </form>
        <ul>
            <c:forEach var="rateFood" items="${listRateFoods}">
                <li>${rateFood.rate}, ${rateFood.food.name}
            </c:forEach>
        </ul>
       
    </body>
</html>
