<%--
  Created by IntelliJ IDEA.
  User: mikeubu
  Date: 18.07.18
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
    <title>Edycja Zadan</title>
    <style>
        .error {
            color: red
        }
    </style>
</head>
<body>
<form:form action="/tasks/edit/${task.id}" method="post"
           modelAttribute="task">
    Tytuł<form:input path="title" />
    <form:errors path="title" cssClass="error"/>
    <br>
    Opis<form:input path="description" />
    <form:errors path="description" cssClass="error"/>
    <br>
    Typ <form:select path="status">
    <form:option value="1" label="Zadanie" />
    <form:option value="2" label="Zamówienie" />
</form:select>
    <br>
    Operator:
    <form:select itemValue="id" itemLabel="name" path="user.id"
                 items="${users}" />
    <br>
    Klient:
    <form:select itemValue="id" itemLabel="company" path="client.id"
                 items="${clients}" />
    <br>
    <input type="submit" value="Zapisz">

     <form:hidden path="created" />

 </form:form>
 <form action="/tasks/list">
     <input type="submit" value="Anuluj" />
 </form>
 </body>
 </html>
