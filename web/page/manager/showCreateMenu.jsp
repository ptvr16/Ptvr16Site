<%-- 
    Document   : showCreateMenu
    Created on : May 10, 2019, 9:56:22 AM
    Author     : pupil
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Создание меню</title>
    </head>
    <body>
        <h1>Создаем меню</h1>
        <form action="createMenu" method="POST">
            <table>
                <tr>
                    <td>
                        <c:forEach var="food" items="${listFoods}">
                            <p>
                                ${food.name} <input type="checkbox" name="food" value="${food.id}">
                            </p>
                        </c:forEach>  
                    </td>
                    <td>
                        Понедельник <input type="radio" name="weekDay" value="Понедельник">
                        Вторник <input type="radio" name="weekDay" value="Вторник">
                        Среда <input type="radio" name="weekDay" value="Среда">
                        Четверг <input type="radio" name="weekDay" value="Четверг">
                        Пятница <input type="radio" name="weekDay" value="Пятница">

                    </td>
                </tr>
            </table>
            <input type="submit" value="Назначить">
        </form>
    </body>
</html>
