<%-- 
    Document   : index
    Created on : Mar 28, 2019, 12:47:44 PM
    Author     : pupil
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food Quantity</title>
    </head>
    <body>
        <H1>Добро пожаловать в нашу столовую</H1>
        <h2>Здесь вы можете посмотреть наше меню на день и оставить свою оценку нашим блюдам </h2>
        ${info}<br>
        <a href="showLogin">Войти</a><br>
        <a href="logout">Выйти</a><br>
        <a href="showRegistration">Зарегистрироваться</a><br>
    </body> 
</html>
