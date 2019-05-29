
        <form action="createRate" method="POST">
            <h1>Просмотр списка блюд</h1>
            <a href="showListFoods">Вернуться к списку меню</a><br>
            <c:forEach var="entry" items="${mapDateFoodCover}">
                Фото: <br>
                <img src="insertFile/${entry.value.path}"  ><br>
                Заголовок: ${entry.key.food.name}<br>
                Описание: ${entry.key.food.description}<br>

                <input type="hidden" name="foodId" value="${entry.key.food.id}">

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
