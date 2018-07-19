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
    <title>Lista Zadań</title>
</head>
<body>
<table border=1>
    <tr>
        <th>Klient</th>
        <th>Tytuł</th>
        <th>Opis</th>
        <th>Utworzono</th>
        <th>Ostatnia zmiana</th>
        <th>Status</th>
        <th>Zapłacono</th>
        <th>Wysłano</th>
        <th>Operator</th>

    </tr>
    <c:forEach items="${tasks}" var="item">
        <tr>
            <td>${item.client.company}</td>
            <td>${item.title}</td>
            <td>${item.description}</td>
            <td>${item.created}</td>
            <td>${item.lastModified}</td>
            <td><c:if test="${item.status == 0}">
                    Archiwum
             </c:if>
                <c:if test="${item.status == 1}">
                    Zadanie
                </c:if>
                <c:if test="${item.status == 2}">
                   Zamowienie
                </c:if>
            <td>${item.paid}</td>
            <td>${item.send}</td>
            <td>${item.user.name}</td>
            <td>
                <input type="button" onclick="location.href='/tasks/edit/${item.id}';" value="Edytuj" />
                <input type="button" onclick="location.href='/tasks/delete/${item.id}';" value="Usun" />
            </td>
        </tr>
    </c:forEach>
</table>
<br>
<form action="add">
    <input type="submit" value="Nowe zadanie" />
</form>
<form action="/home">
    <input type="submit" value="Powort do strony glownej" />
</form>
</body>
</html>
