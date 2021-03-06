<%-- 
    Document   : getuserData
    Created on : Apr 2, 2020, 12:53:28 AM
    Author     : ahmed
<% ConnectDB db = new ConnectDB();
    Vector<User> users = db.getAllUsers();

    for (User usr : users) {

%>
<%= usr.username%> 
<%= usr.pass%> 

  <%
        if (session.getAttribute("islogin").equals(true))
    {%>
        you are login in already

   <%} else {%>



<%}%> 
--%>
<jsp:include page="header.jsp"/>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.Vector"%>
<%@page import="DataBase.ConnectDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Data.User" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Users</title>
    </head>
    <style>

        table.blueTable {
            border: 1px solid #1C6EA4;
            background-color: #EEEEEE;
            width: 100%;
            text-align: center;
            border-collapse: collapse;
        }
        table.blueTable td, table.blueTable th {
            border: 1px solid #AAAAAA;
            padding: 10px 7px;
        }
        table.blueTable tbody td {
            font-size: 23px;
        }
        table.blueTable tr:nth-child(even) {
            background: #D0E4F5;
        }
        table.blueTable thead {
            background: #1C6EA4;
            background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
            background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
            background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
            border-bottom: 2px solid #444444;
        }
        table.blueTable thead th {
            font-size: 35px;
            font-weight: bold;
            color: #FFFFFF;
            border-left: 2px solid #D0E4F5;
        }
        table.blueTable thead th:first-child {
            border-left: none;
        }



        table.blueTable tfoot .links {
            text-align: right;
        }


    </style>
    <body>


        <table class="blueTable">
            <thead>
                <tr>
                    <th>User Id</th>
                    <th>username</th>
                    <th>password</th>
                    <th>Email</th>
                    <th>Credit</th>
                    <th colspan=2>Action</th>
                </tr>
            </thead>
            <tbody>

                <c:forEach items="${users}" var="user">
                    <tr>
                        <td><c:out value="${user.id}" /></td>
                        <td><c:out value="${user.username}" /></td>
                        <td><c:out value="${user.pass}" /></td>
                        <td><c:out value="${user.email}" /></td>
                        <td><c:out value="${user.credit_limit}" /></td>
                        <td><a href="UserController?action=delete&userId=<c:out value="${user.id}"/>">Delete</a></td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>


    </body>
</html>
