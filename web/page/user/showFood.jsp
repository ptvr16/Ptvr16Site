<div class="container" style="background-image: url(css//Design//container7.png); height: 1900px; width: 650px; border-left: 3px outset #8B4513; border-right: 3px outset #8B4513;">
 
            <h1 class="h">Просмотр списка блюд</h1>
            <a href="showListFoods" style="margin-left: 210px"><img src="css//Design//button8.png"></a><br>
            <form action="createRate" method="POST" class="p6" style="text-align: center;">
            <c:forEach var="entry" items="${mapDateFoodCover}">
                Фото: <br>
                <img src="insertFile/${entry.value.path}" class="rounded mx-auto d-block" style="width: 200px; height: 200px;"><br>
                Заголовок: ${entry.key.food.name}<br>
                Описание: ${entry.key.food.description}<br>

                <input type="hidden" name="foodId" value="${entry.key.food.id}">

                <div class="form-group">
                    <label for="exampleFormControlSelect1"></label>
                    <select class="form-control form-control-sm" name="rateId" id="exampleFormControlSelect1" style="width: 200px; margin-left: 210px; font-size: 24px;">
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
            <input type="image" value="Отправить отзыв" src="css//Design//button11.png">
        </form>
</div>