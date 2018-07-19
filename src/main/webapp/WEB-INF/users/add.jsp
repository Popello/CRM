<%--
  Created by IntelliJ IDEA.
  User: mikeubu
  Date: 18.07.18
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
    <title>Dodaj Uzytkownika</title>
    <style>
        .error {
            color: red
        }
    </style>
</head>

<body>

<form:form action="/users/add" method="post"
           modelAttribute="user">
    Nazwa<form:input path="name" />
    <form:errors path="name" cssClass="error"/>
    <br>
    Haslo<form:password path="password" />
    <form:errors path="password" cssClass="error"/>
    <br>
    Imie<form:input path="firstName" />
    <form:errors path="firstName" cssClass="error"/>
    <br>
    Nazwisko<form:input path="lastName" />
    <form:errors path="lastName" cssClass="error"/>
    <br>
    E-mail<form:input path="email" />
    <form:errors path="email" cssClass="error"/>
    <br>
    category<form:select path="category">
        <form:option value="3" label="Pracownik" />
        <form:option value="2" label="Manager" />
        <form:option value="1" label="Boss" />
    </form:select>
    <br>
    <input type="submit" value="Dodaj">
</form:form>
<form action="/users/list">
    <input type="submit" value="Anuluj" />
</form>

</body>
</html>
