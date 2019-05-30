<div class="container" style="background-image: url(css//Design//container5.png); height: 880px; width: 650px; border-left: 3px outset #8B4513; border-right: 3px outset #8B4513;">
        <h1 class="h">Загрузка файла!</h1>
        <p>${info}</p>
        <a href="showAddNewFood"><img src="css//Design//button10.png" style="margin-left: 210px"></a><br>
        <br>
        <form action="uploadFile" method="POST" enctype="multipart/form-data" style="text-align: center;">
            <input type="text" name="description" style="border-radius: 5px;"><br>
            <input type="file" name="file" style="margin-left: 115px;"><br>
            <br>
            <input type="submit" value="Загрузить" style="border-radius: 5px;">
        </form>
</div>