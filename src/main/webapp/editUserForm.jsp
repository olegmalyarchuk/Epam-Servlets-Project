<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.lang}" />
<fmt:setBundle basename="messages" />
<html>
<head>
    <title><fmt:message key="editUserForm.title" /></title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <link rel="shortcut icon" href="/resources/images/logo.png" type="image/png">
</head>
<body>
<input type="hidden" id="editStatus" value="<%=request.getAttribute("editStatus")%>">
<input type="hidden" id="lang" value="<%=request.getSession().getAttribute("lang")%>">
<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: #0074D9">
        <ul class="navbar-nav">
            <li><a href="listEvent"
                   class="nav-link"><fmt:message key="header.events" /></a></li>
        </ul>
        <ul class="navbar-nav">
            <li><a href="showProfile"
                   class="nav-link"> <fmt:message key="header.profile" /></a></li>
        </ul>
        <ul class="navbar-nav">
            <li><a href="/logout"
                   class="nav-link"><fmt:message key="header.logout" /></a></li>

        </ul>
        <ul class="nav justify-content-end">
            <li><a href="lang?lang=ua"
                   class="nav-link"><img src="/resources/images/lang/ukr.png" width="24" /></a></li>
        </ul>
        <ul class="nav justify-content-end">
            <li><a href="lang?lang=en"
                   class="nav-link"><img src="/resources/images/lang/eng.png" width="24" /></a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="updateUser" method="post">
                    <caption>
                        <h2><fmt:message key="editUserForm.edituser" /></h2>
                    </caption>

                        <input type="hidden" name="password" value="<c:out value='${user.user_password}' />" />

                    <fieldset class="form-group">
                        <label></label> <input type="hidden"
                                                            value="<c:out value='${user.id}' />" class="form-control"
                                                            name="user_id" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label><fmt:message key="editUserForm.roleid" /></label> <input type="text"
                                                            value="<c:out value='${user.role_id}' />" class="form-control"
                                                            name="role_id" required="required">
                    </fieldset>
                    <fieldset class="form-group">
                        <label><fmt:message key="editUserForm.username" /></label> <input type="text"
                                                             value="<c:out value='${user.user_name}' />" class="form-control"
                                                             name="user_name" required="required">
                    </fieldset>
                    <fieldset class="form-group">
                        <label><fmt:message key="editUserForm.usersurname" /></label> <input type="text"
                                                             value="<c:out value='${user.user_surname}' />" class="form-control"
                                                             name="user_surname" required="required">
                    </fieldset>
                    <fieldset class="form-group">
                        <label><fmt:message key="editUserForm.userphone" /></label> <input type="text"
                                                                  value="<c:out value='${user.user_phone}' />" class="form-control"
                                                                  name="user_phone" required="required">
                    </fieldset>
                    <fieldset class="form-group">
                        <label><fmt:message key="editUserForm.useremail" /></label> <input type="email"
                                                                   value="<c:out value='${user.user_email}' />" class="form-control"
                                                                   name="user_email" required="required">
                    </fieldset>
                    <label><fmt:message key="editUserForm.userphotourl" /></label> <input type="text"
                                                     value="<c:out value='${user.user_photo_url}' />" class="form-control"
                                                     name="user_photo_url" required="required">
                    </fieldset>
                    <fieldset class="form-group">
                        <label><fmt:message key="editUserForm.useraddress" /></label> <input type="text"
                                                              value="<c:out value='${user.user_address}' />" class="form-control"
                                                              name="user_address" required="required">
                    </fieldset>


                    <button type="submit" class="btn btn-success"><fmt:message key="button.save" /></button>
                </form>
        </div>
    </div>
</div>
<!--- JS -->
<script src="vendor/jquery/jguery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweatalert.css ">
<script type="text/javascript">
    var editStatus = document.getElementById("editStatus").value;
    var lang = document.getElementById("lang").value;
    if(lang=="en") {
        if(editStatus == "invalidId") {
            swal("Error", "Invalid Role ID", "error");
        }
        if (editStatus == "emptyFirstname") {
            swal("Error", "First name should not be empty", "error");
            //alert("First name should not be empty");
        }
        if (editStatus == "emptyLastname") {
            swal("Error", "Last name should not be empty", "error");
            //alert("Last name should not be empty");
        }
        if (editStatus == "emptyPassword") {
            swal("Error", "Password should not be empty", "error");
            //alert("Password should not be empty");
        }
        if (editStatus == "emptyPhone") {
            swal("Error", "Phone should not be empty", "error");
            //alert("Phone should not be empty");
        }
        if (editStatus == "emptyEmail") {
            swal("Error", "Email should not be empty", "error");
            //alert("Email should not be empty");
        }
        if (editStatus == "emptyAddress") {
            swal("Error", "Location should not be empty", "error");
            //alert("Location should not be empty");
        }
        if (editStatus == "invalidConfirmpassword") {
            swal("Error", "Password not match", "error");
            //alert("Password not match");
        }
        if (editStatus == "invalidFirstname") {
            swal("Error", "First name should starts with a capital letter and no more than 25 letters long", "error");
            //alert("First name should starts with a capital letter and no more than 25 letters long")
        }
        if (editStatus == "invalidLastname") {
            swal("Error", "Last name should starts with a capital letter and no more than 25 letters long", "error");
            //alert("Last name should starts with a capital letter and no more than 25 letters long")
        }
        if (editStatus == "invalidPassword") {
            swal("Error", "Password must consist of at least 4 characters and not more than 16 characters", "error");
            // alert("Password must consist of at least 4 characters and not more than 16 characters")
        }
        if (editStatus == "invalidPhone") {
            swal("Error", "Phone must starts with + and has 9 digits.", "error");
            //  alert("Phone must starts with + and has 9 digits.")
        }
        if (editStatus == "invalidEmail") {
            swal("Error", "Email must has no less than 1 letter before '@', 2 letters after and domain is no longer than 4 characters", "error");
            // alert("Email must has no less than 1 letter before '@', 2 letters after and domain is no longer than 4 characters")
        }
        if (editStatus == "dublicateEmail") {
            swal("Error", "Current email is already registered. Try to log in.", "error");
            // alert("Current email is already registered. Try to log in.")
        }
        if (editStatus == "dublicatePhone") {
            swal("Error", "Current phone is already registered. Try to log in.", "error");
            // alert("Current phone is already registered. Try to log in.")
        }
        if (editStatus == "success") {
            swal("Congrats", "You have successfully updated information", "success");
            // alert("You have successfully registered.")
        }
        if (editStatus == "servererror") {
            swal("Error", "It is technical work on the site. Please try again.", "error");
            //alert("It is technical work on the site. Please try again.")
        }
    } else {
        if(editStatus == "invalidId") {
            swal("Error", "Некорректний ID Ролі", "error");
        }
        if (editStatus == "emptyFirstname") {
            swal("Помилка", "Ім'я не повинно бути порожнє", "error");
            //alert("First name should not be empty");
        }
        if (editStatus == "emptyLastname") {
            swal("Помилка", "Прізвище не повинно бути порожнє", "error");
            //alert("Last name should not be empty");
        }
        if (editStatus == "emptyPassword") {
            swal("Помилка", "Пароль не  повинен бути порожнім", "error");
            //alert("Password should not be empty");
        }
        if (editStatus == "emptyPhone") {
            swal("Помилка", "Телефон не  повинен бути порожнім", "error");
            //alert("Phone should not be empty");
        }
        if (editStatus == "emptyEmail") {
            swal("Помилка", "Емейл не  повинен бути порожнім", "error");
            //alert("Email should not be empty");
        }
        if (editStatus == "emptyAddress") {
            swal("Помилка", "Адрес не  повинен бути порожнім", "error");
            //alert("Location should not be empty");
        }
        if (editStatus == "invalidConfirmpassword") {
            swal("Помилка", "Паролі не співпадають", "error");
            //alert("Password not match");
        }
        if (editStatus == "invalidFirstname") {
            swal("Помилка", "Ім'я повинно починатися з великої літери, та мати довжину не більше ніж 25 символів", "error");
            //alert("First name should starts with a capital letter and no more than 25 letters long")
        }
        if (editStatus == "invalidLastname") {
            swal("Помилка", "Прізвище повинно починатися з великої літери, та мати довжину не більше ніж 25 символів", "error");
            //alert("Last name should starts with a capital letter and no more than 25 letters long")
        }
        if (editStatus == "invalidPassword") {
            swal("Помилка", "Пароль має мати довджину від 4 до 16 символів", "error");
            // alert("Password must consist of at least 4 characters and not more than 16 characters")
        }
        if (editStatus == "invalidPhone") {
            swal("Помилка", "Телефон має починатися з + і мати 9 знаків", "error");
            //  alert("Phone must starts with + and has 9 digits.")
        }
        if (editStatus == "invalidEmail") {
            swal("Помилка", "Емейл має мати не менше, ніж 1 літеру до @, дві після і, щонайменше, 4 в домені", "error");
            // alert("Email must has no less than 1 letter before '@', 2 letters after and domain is no longer than 4 characters")
        }
        if (editStatus == "dublicateEmail") {
            swal("Помилка", "Такий емейл вже зареєстрований. Попробуйте увійти", "error");
            // alert("Current email is already registered. Try to log in.")
        }
        if (editStatus == "dublicatePhone") {
            swal("Помилка", "Такий телефон вже зареєстрований. Попробуйте увійти", "error");
            // alert("Current phone is already registered. Try to log in.")
        }
        if (editStatus == "success") {
            swal("Успіх", "Ви успішно оновили інформацію", "success");
            // alert("You have successfully registered.")
        }
        if (editStatus == "servererror") {
            swal("Помилка", "На сайті технічні роботи, повторіть спробу пізніше", "error");
            //alert("It is technical work on the site. Please try again.")
        }
    }
</script>
</body>
</html>
