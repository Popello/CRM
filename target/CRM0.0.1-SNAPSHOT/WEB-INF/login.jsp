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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>


<body>


<div class="loginContainer container">

        <c:if test="${param.error != null}">
        <div class="alert alert-danger">
            <h4><small>Błędne Dane Logowania</small></h4>
        </div>
        </c:if>
    <c:if test="${param.loggedout != null}">
        <div class="alert alert-info">
            <h4><small>Wylogowano z Konta</small></h4>
        </div>
    </c:if>
    <h3>Logowanie</h3>
    <form class="form-horizontal" method="post" action="/login">
        <input type="text" name="name" class="form-control" placeholder="Nazwa Użytkownika">
        <input type="password" name="password" class="form-control" placeholder="Hasło">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-dark">Zaloguj</button>
    </form>
</div>
</body>
</html>
