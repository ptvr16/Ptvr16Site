
        <h1>Список меню</h1>
        ${info}<br>
        <a href="index">Главная страница</a><br>
        <ul>
            
            <c:forEach var="entry" items="${mapWeek}">
                <li>
                    <a href="showFood?date=${entry.value}"> ${entry.key} </a>
                </li>
            </c:forEach>
        </ul>
