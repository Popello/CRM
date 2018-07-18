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
        <th>Imie</th>
        <th>Nazwisko</th>
        <th>Email</th>
        <th>Akcja</th>
    </tr>
    <c:forEach items="${users}" var="item">
        <tr>
            <td>${item.firstName}</td>
            <td>${item.lastName}</td>
            <td>${item.email}</td>
            <td><a href="/users/edit/${item.id}">Edit</a> <a href="/users/delete/${item.id}">Delete</a></td>
        </tr>
    </c:forEach>
    <br>
    <a href="add">dodaj Uzytkownika</a>
    <br>
    <a href="/home">powrot do strony glownej</a>
</table>
</body>
</html>
