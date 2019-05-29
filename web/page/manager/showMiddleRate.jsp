<div class="container" style="background-image: url(css//Design//container5.png); height: 970px; width: 650px; border-left: 3px outset #8B4513; border-right: 3px outset #8B4513;">
        <h1 class="h">Здесь вы можете посмотреть средний балл оценок</h1>
        ${info}<br>
        <a href="index"><img src="css//Design//button4.png" style="margin-left: 210px"></a><br>
        <a href="showHistoryRate"><img src="css//Design//button8.png" style="margin-left: 210px"></a><br>
        
        <ul class="p5">
            <c:forEach var="entry" items="${mapRatingFoods}">
                <li>${entry.key.name}, ${entry.value}
            </c:forEach>
        </ul>
</div>