<div class="container" style="background-image: url(css//Design//container5.png); height: 880px; width: 650px; border-left: 3px outset #8B4513; border-right: 3px outset #8B4513;">

    <h1 class="h">Изменить пароль</h1>
        
    <p class="p">Здравствуйте, ${username}, вы вошли как ${login}</p>
    <a href="index"><img src="css//Design//button4.png" style="margin-left: 205px;"></a><br>
        <form action="changePassword" method="POST">
            <br>
            <p class="p1">Введите действующий пароль:</p>
            <input type="password" name="oldPassword" style="margin-left: 215px; width: 185px; height: 30px" class="form-control">
            
            <p class="p2">Введите новый пароль:</p>
            <input type="password" name="newPassword1" style="margin-left: 215px; width: 185px; height: 30px" class="form-control">
            
            <p class="p3">Повторите пароль:</p>
            <input type="password" name="newPassword2" style="margin-left: 215px; width: 185px; height: 30px" class="form-control">
        </form>
        <br>
    <input type="image" value="Изменить пароль" src="css//Design//button6.png" style="margin-left: 205px;">
</div>