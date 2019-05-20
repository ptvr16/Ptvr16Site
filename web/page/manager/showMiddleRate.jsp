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
        <a href="index">Главная страница</a><br>
        <a href="showHistoryRate">Вернуться к списку проголосовавших</a><br>
        
        <ul>
            <c:forEach var="entry" items="${mapRatingFoods}">
                <li>${entry.key.name}, ${entry.value}
            </c:forEach>
        </ul>
       
    </body>
</html>
