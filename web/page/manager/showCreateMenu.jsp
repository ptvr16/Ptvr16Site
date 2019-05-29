
        <h1>Создаем меню</h1>
        <form action="createMenu" method="POST">
            <table>
                <tr>
                    <td>
                        <c:forEach var="food" items="${listFoods}">
                            <p>
                                ${food.name} <input type="checkbox" name="food" value="${food.id}">
                            </p>
                        </c:forEach>  
                    </td>
                    <td>
                        Понедельник <input type="radio" name="weekDay" value="1"><br>
                        Вторник <input type="radio" name="weekDay" value="2"><br>
                        Среда <input type="radio" name="weekDay" value="3"><br>
                        Четверг <input type="radio" name="weekDay" value="4"><br>
                        Пятница <input type="radio" name="weekDay" value="5"><br>

                    </td>
                </tr>
            </table>
            <input type="submit" value="Назначить">
        </form>
