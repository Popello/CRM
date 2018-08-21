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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {height: 450px}

        /* Set gray background color and 100% height */
        .sidenav {
            padding-top: 20px;
            background-color: #f1f1f1;
            height: 100%;
        }

        /* Set black background color, white text and some padding */
        footer {
            background-color: #555;
            color: white;
            padding: 15px;
        }

        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }
            .row.content {height:auto;}
        }
    </style>
</head>

<body>



<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/"><strong>Witaj ${username}</strong></a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/">Home</a></li>
                <li><a href="/users/list">Uzytkownicy</a></li>
                <li><a href="/tasks/list">Zadania</a></li>
                <li><a href="/clients/list">Klienci</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> Wyloguj</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid text-center">
    <div class="row content">
        <div class="col-sm-2 sidenav">
            <p><a href="#">Link</a></p>
            <p><a href="#">Link</a></p>
            <p><a href="#">Link</a></p>
        </div>
        <div class="col-sm-10 text-left">
            <input class="form-control" id="myInput" type="text" placeholder="Szukaj">
            <br>
            <table class="table table-hover">
                <thead>
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
                </thead>
                <tbody id="myTable">
                <c:forEach items="${tasks}" var="item">
                    <tr >
                        <td onclick="location.href='/tasks/edit/${item.id}';">${item.client.company}</td>
                        <td onclick="location.href='/tasks/edit/${item.id}';">${item.title}</td>
                        <td onclick="location.href='/tasks/edit/${item.id}';">${item.description}</td>
                        <td onclick="location.href='/tasks/edit/${item.id}';">${item.created}</td>
                        <td onclick="location.href='/tasks/edit/${item.id}';">${item.lastModified}</td>
                        <td onclick="location.href='/tasks/edit/${item.id}';"><c:if test="${item.status == 0}">
                            Archiwum
                            </c:if>
                            <c:if test="${item.status == 1}">
                            Zadanie
                            </c:if>
                            <c:if test="${item.status == 2}">
                            Zamowienie
                            </c:if>

                        <c:if test="${item.paid != null}">
                        <td onclick="location.href='/tasks/edit/${item.id}';">
                            ${item.paid}
                        </td>
                        </c:if>
                            <c:if test="${item.paid == null}">
                        <td>
                                <input type="button" class="btn btn-dark btn-sm" onclick="location.href='/tasks/pay/${item.id}';" value="Akceptuj" />
                        </td>
                            </c:if>


                            <c:if test="${item.send != null}">
                                <td onclick="location.href='/tasks/edit/${item.id}';">
                                ${item.send}
                                </td>
                            </c:if>
                            <c:if test="${item.send == null}">
                        <td>
                                <input type="button" class="btn btn-dark btn-sm" onclick="location.href='/tasks/send/${item.id}';" value="Akceptuj" />
                        </td>
                            </c:if>

                        <td onclick="location.href='/tasks/edit/${item.id}';">${item.user.name}</td>
                        <td>
                            <input type="button" class="btn btn-dark btn-sm" onclick="location.href='/tasks/delete/${item.id}';" value="Usun" />
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <br>
            <form action="add">
                <input type="submit" class="btn btn-dark" value="Dodaj Zadanie" />
            </form>
        </div>
    </div>
    <script>
        $(document).ready(function(){
            $("#myInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
    <footer class="container-fluid text-center">
        <p>Made by Popello</p>
    </footer>


 </body>
 </html>
