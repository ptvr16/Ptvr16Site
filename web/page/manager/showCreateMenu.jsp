<div class="container" style="background-image: url(css//Design//container6.png); height: 880px; width: 650px; border-left: 3px outset #8B4513; border-right: 3px outset #8B4513;">
        <h1 class="h">Создаем меню</h1>
        <form action="createMenu" method="POST"">
            <table style="margin-left: 150px; margin-top: 60px;"  class="p6">
                <tr>
                    <td>
                        <c:forEach var="food" items="${listFoods}">
                            <p>
                                ${food.name} <input type="checkbox" name="food" value="${food.id}">
                            </p>
                        </c:forEach>  
                    </td>
                    <td style="text-align: center;">
                        Понедельник <input type="radio" name="weekDay" value="1"><br>
                        Вторник <input type="radio" name="weekDay" value="2"><br>
                        Среда <input type="radio" name="weekDay" value="3"><br>
                        Четверг <input type="radio" name="weekDay" value="4"><br>
                        Пятница <input type="radio" name="weekDay" value="5"><br>

                    </td>
                </tr>
            </table>
            <input type="image" value="Назначить" src="css//Design//button11.png" style="margin-left: 220px;">
        </form>
</div>