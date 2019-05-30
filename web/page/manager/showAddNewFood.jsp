<div class="container" style="background-image: url(css//Design//container6.png); height: 880px; width: 650px; border-left: 3px outset #8B4513; border-right: 3px outset #8B4513;">
        <h1 class="h">Добавить блюдо</h1>
        ${info}<br>
        <a href="index"><img src="css//Design//button4.png" style="margin-left: 210px"></a>
        <br>
        <a href="showUploadFile"><img src="css//Design//button9.png" style="margin-left: 210px"></a>
        <form action="addNewFood" method="POST" style="text-align: center;">
            Название:<br>
            <input type="text" name="name" style="border-radius: 5px;"><br>
            Описание:<br>
            <input type="text" name="description" style="border-radius: 5px;"><br>
            <br>
            Фото блюда:<br>
            <select name="coverId" style="border-radius: 5px;">
                <c:forEach var="cover" items="${listCovers}">
                    <option value="${cover.id}">${cover.name}</option>
                </c:forEach>
            </select>
            <br>
            <input type="submit" value="Добавить блюдо">
        </form>
</div>