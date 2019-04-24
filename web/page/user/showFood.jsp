<%-- 
    Document   : showBook
    Created on : Mar 7, 2019, 10:14:49 AM
    Author     : Melnikov
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Добро пожаловать</title>
    </head>
    <body>
        <form action="createRate" method="POST">
            <a href="index">Главная страница</a><br>
            <h1>Просмотр списка блюд</h1>
            <c:forEach var="entry" items="${mapFoodCover}">
                Фото: <br>
                <img src="insertFile/${entry.value.path}"  ><br>
                Заголовок: ${entry.key.name}<br>
                Описание: ${entry.key.description}<br>

                <input type="hidden" name="foodId" value="${entry.key.id}">

                <div class="form-group">
                    <label for="exampleFormControlSelect1">Example select</label>
                    <select class="form-control" name="rateId" id="exampleFormControlSelect1">
                      <option value="1">Очень плохо, не могу больше</option>
                      <option value="2">Плохо, вкус специфический</option>
                      <option value="3">Хорошо, но чего-то не хватает</option>
                      <option value="4">Отлично, можно и добавку</option>
                      <option value="5">Зашибись, ещё поел бы</option>
                    </select>
                </div>
                <br>
                
            </c:forEach>
                <br>
            <input type="submit" value="Отправить отзыв">
        </form>
    </body>
</html>
