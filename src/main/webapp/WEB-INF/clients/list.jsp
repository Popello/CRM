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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>Title</title>
</head>
<body>
<table border=1>
    <tr>
        <th>Firma</th>
        <th>Imie i nazwisko</th>
        <th>Telefon</th>
        <th>Email</th>
        <th>Opcje</th>
    </tr>
    <c:forEach items="${clients}" var="item">
        <tr>
            <td>${item.company}</td>
            <td>${item.name}</td>
            <td>${item.telephone}</td>
            <td>${item.email}</td>
            <td>
                <input type="button" onclick="location.href='/clients/edit/${item.id}';" value="Edytuj" />
                <input type="button" onclick="location.href='/clients/delete/${item.id}';" value="Usun" />
            </td>
        </tr>
    </c:forEach>
</table>
<br>
<form action="add">
    <input type="submit" value="Dodaj Klienta" />
</form>
<form action="/home">
    <input type="submit" value="Powort do strony glownej" />
</form>
</body>
</html>
