<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<h1>User Management</h1>
<h2>
    <a href="/users?action=create">Add New User</a>
</h2>
<fieldset>
    <legend>Search User</legend>
    <form action="/users?action=search" method="post">
        <input type="text" name="countryUser" placeholder="Input country user...">
        <input type="submit" value="Search">
    </form>
</fieldset>

<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div align="center">
    <a href="/users?action=asc">Ascending List</a>
</div>
</body>
</html>
