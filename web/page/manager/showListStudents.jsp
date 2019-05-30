<div class="container" style="background-image: url(css//Design//container6.png); height: 880px; width: 650px; border-left: 3px outset #8B4513; border-right: 3px outset #8B4513;">
    <h1 class="h">Список студентов</h1>
        <p class="p">${info}</p><br>
        <ul class="p5">
            <c:forEach var="student" items="${listStudents}">
                <li>${student.name} ${student.surname}, ${student.email}
            </c:forEach>
        </ul><br>
        <a href="index"><img src="css//Design//button4.png" style="margin-left: 210px"></a><br>
</div>