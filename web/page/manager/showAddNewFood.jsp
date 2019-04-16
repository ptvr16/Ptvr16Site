<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Меню</title>
    </head>
    <body>
        <h1>Добавить блюдо</h1>
        ${info}<br>
        <a href="index">Главная страница</a><br>
        <a href="showUploadFile">Загрузить изображение блюда</a>
        <form action="addNewFood" method="POST">
            Название:<br>
            <input type="text" name="name"><br>
            Описание:<br>
            <input type="text" name="description"><br>
            <br>
            Фото блюда:<br>
            <select name="coverId">
                <c:forEach var="cover" items="${listCovers}">
                    <option value="${cover.id}">${cover.name}</option>
                </c:forEach>
            </select>
            <br>
            <input type="submit" value="Добавить блюдо">
        </form>
    </body>
</html>
