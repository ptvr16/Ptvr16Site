<div class="container" style="background-image: url(css//Design//container5.png); height: 880px; width: 650px; border-left: 3px outset #8B4513; border-right: 3px outset #8B4513;">
        <h1 class="h">Список меню</h1>
        <p class="p5" style="margin-left: 220px;">${info}</p><br>
        <a href="index"><img src="css//Design//button4.png" style="margin-left: 210px"></a><br>
        <ul class="p6" style="margin-left: 230px; margin-top: 50px;">
            
            <c:forEach var="entry" items="${mapWeek}">
                <li>
                    <a href="showFood?date=${entry.value}"> ${entry.key} </a>
                </li>
            </c:forEach>
        </ul>
</div>