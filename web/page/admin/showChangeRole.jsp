<div class="container" style="background-image: url(css//Design//container5.png); height: 880px; width: 650px; border-left: 3px outset #8B4513; border-right: 3px outset #8B4513;">
        <h1 class="h">Страница администратора</h1>
        <a href="index"><img src="css//Design//button4.png" style="margin-left: 210px"></a><br>
        <br>
        <p class="p">Список пользователей: </p>
        <br>
        <form action="changeRole" method="POST" style="margin-left: 200px">
            <c:forEach var="role" items="${listRoles}">
                <c:if test="${role.id == 3}">
                    <p class="p5"><input name="roleId" type="radio" checked value="${role.id}">${role.name}</p>
                </c:if>
                <c:if test="${role.id ne 3}">
                    <p  class="p5"><input name="roleId" type="radio" value="${role.id}">${role.name}</p>
                </c:if>    
                
            </c:forEach>
                    <select name="userId" class="form-control form-control-sm" style="width: 220px">
                <option value="#" selected></option>
                <c:forEach var="entry" items="${mapUsers}">
                    <option value="${entry.key.id}">${entry.key.login}: "${entry.value.name}"</option>
                </c:forEach>
            </select>
            <br>
            <br>
        <input type="image" value="Назначить" src="css//Design//button7.png">
        </form>
</div>