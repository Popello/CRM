<%--
  Created by IntelliJ IDEA.
  User: mikeubu
  Date: 18.07.18
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Uzytkownicy</title>
</head>
<body>
<table border=1>
    <tr>
        <th>Nazwa</th>
        <th>Imie</th>
        <th>Nazwisko</th>
        <th>Email</th>
        <th>Rola</th>
        <th>Opcje</th>
    </tr>
    <c:forEach items="${users}" var="item">
        <tr>
            <td>${item.name}</td>
            <td>${item.firstName}</td>
            <td>${item.lastName}</td>
            <td>${item.email}</td>
            <td><c:if test="${item.category == 0}">
                    Admin
                </c:if>
                <c:if test="${item.category == 1}">
                    Boss
                </c:if>
                <c:if test="${item.category == 2}">
                    Manager
                </c:if>
                <c:if test="${item.category == 3}">
                    Pracownik
                </c:if>
            </td>
            <td>
                <input type="button" onclick="location.href='/users/edit/${item.id}';" value="Edytuj" />
                <input type="button" onclick="location.href='/users/delete/${item.id}';" value="Usun" />
            </td>
        </tr>
    </c:forEach>
</table>
<br>
<form action="add">
    <input type="submit" value="dodaj Uzytkownika" />
</form>
<form action="/home">
    <input type="submit" value="powort do strony glownej" />
</form>
</body>
</html>
