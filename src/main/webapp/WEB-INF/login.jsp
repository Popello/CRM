<%--
  Created by IntelliJ IDEA.
  User: mikeubu
  Date: 18.07.18
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>

<html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %><html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<head>
    <title>Login</title>
    <style>
        .error {
            color: red
        }
    </style>
</head>
<body>
<body>
<div>
    <c:if test="${param.loggedout != null}">
        <h3>Wylogowano z Konta</h3>
    </c:if>
</div>
<div>
    <h3>Logowanie</h3>
    <div>
        <c:if test="${param.error != null}">
            <h3>Błędne Dane Logowania</h3>
        </c:if>
    </div>
    <form method="post" action="/login">
        <input type="text" name="name" placeholder="Wprowadź Nazwę Użytkownika">
        <input type="password" name="password" placeholder="Wprowadź Hasło">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Zaloguj">
    </form>
</div>

<div>
    <h3>Rejestracja</h3>
    <form:form method="post" action="/register" modelAttribute="user">

        <form:input path="name" placeholder="Wprowadź Nazwę Użytkownika"/>
        <br>
        <form:input path="email" placeholder="Wprowadź Email"/>
        <br>
        <form:input type="password" path="password" placeholder="Wprowadź Hasło"/>
        <br>
        <form:input path="firstName" placeholder="Wprowadź Imie"/>
        <br>
        <form:input path="lastName" placeholder="Wprowadź Nazwisko"/>
        <br>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Zarejestruj">

    </form:form>

</div>
</body>
</html>
