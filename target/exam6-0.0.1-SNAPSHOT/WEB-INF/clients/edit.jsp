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
    <title>Edycja Klienta</title>
</head>
<body>
<form:form action="/clients/edit/${client.id}" method="post"
           modelAttribute="client">
    Firma<form:input path="company" />
    <form:errors path="company" cssClass="error"/>
    <br>
    Imie i Nazwisko<form:input path="name" />
    <form:errors path="name" cssClass="error"/>
    <br>
    Telefon <form:input path="telephone" />
    <form:errors path="telephone" cssClass="error"/>
    <br>
    E-mail<form:input path="email" />
    <form:errors path="email" cssClass="error"/>
    <br>
    <input type="submit" value="Dodaj">
</form:form>
<form action="/clientss/list">
    <input type="submit" value="Powrot" />
</form>
</body>
</html>
