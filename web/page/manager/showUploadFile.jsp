<%-- 
    Document   : uploadFile
    Created on : Mar 5, 2019, 12:48:27 PM
    Author     : Melnikov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Загрузка файла</title>
    </head>
    <body>
        <h1>Загрузка файла!</h1>
        <p>${info}</p>
        <a href="index">Главная страница</a><br>
        <br>
        <form action="uploadFile" method="POST" enctype="multipart/form-data">
            <input type="text" name="description"><br>
            <input type="file" name="file"><br>
            <input type="submit" value="Загрузить">
        </form>
        
    </body>
</html>
