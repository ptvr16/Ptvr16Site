<div class="container" style="background-image: url(css//Design//container6.png); height: 880px; width: 650px; border-left: 3px outset #8B4513; border-right: 3px outset #8B4513;">
        <h1 class="h">Здесь вы можете посмотреть список проголосовавших</h1>
        ${info}<br>
        <a href="index"><img src="css//Design//button4.png" style="margin-left: 210px"></a>
        <br>
        <br>
        <br>
        <form action="historyRate" style="text-align: center;">
            <select name="day" style="width: 80px; border-radius: 5px;" >
                <c:forEach var="day" begin="1" end="31" >
                    <option value="${day}">${day}</option>
                </c:forEach>
            </select>
            <select name="month" style="width: 80px; border-radius: 5px;">
                <c:forEach var="month" begin="1" end="12" >
                    <option value="${month}">${month}</option>
                </c:forEach>
            </select>
            <select name="year" style="width: 80px; border-radius: 5px;">
                <c:forEach var="year" begin="2018" end="2100" >
                    <option value="${year}">${year}</option>
                </c:forEach>
            </select>
            <input type="SUBMIT" value="На дату">
        </form>
        <ul class="p5" style="margin-left: 100px;">
            <c:forEach var="rateFood" items="${listRateFoods}">
                <li>${rateFood.rate} - ${rateFood.food.name} &nbsp &nbsp &nbsp (${rateFood.user.student.name} ${rateFood.user.student.surname})
            </c:forEach>
        </ul>
</div>