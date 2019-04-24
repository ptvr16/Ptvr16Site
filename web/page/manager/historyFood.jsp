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

        <ul>
            <c:forEach var="student" items="${listStudents}">
                <li>${student.name}, ${student.surname}, ${student.email}
            </c:forEach>
        </ul>
    </body>
</html>
