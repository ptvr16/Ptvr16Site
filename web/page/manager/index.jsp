<%-- 
    Document   : index
    Created on : Mar 13, 2019, 2:55:55 PM
    Author     : Melnikov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <H1>Добро пожаловать</H1>
        ${info}<br>
        <a href="showLogin">Войти</a><br>
        <a href="logout">Выйти</a><br>
        <a href="showRegistration">Зарегистрироваться</a><br>
        <a href="showChangePassword">Изменить пароль</a><br>
        <br>
        <a href="showListStudents">Список студентов</a><br>
             <a href="historyFood">Список проголосовавших</a><br>
        <a href="showAddNewFood">Добавить блюдо</a><br>
        <a href="showFood">Список блюд</a><br>
    </body>
</html>
