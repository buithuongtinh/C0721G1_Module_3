<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top" style="margin: 5px">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item mx-3 hover-item">
                    <a class="nav-link" href="/" style="font-size: 30px; margin-left: 80px">Home</a>
                </li>
                <li class="nav-item hover-item" >
                    <a class="nav-link " href="/furama?action=list-customer" style="font-size: 30px; padding-left: 30px">Customer</a>
                </li>

            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <input type="hidden" name="action" value="">
    <div class="row">
        <div class="col-lg-12">
            <h1 style="text-align: center">List of Result</h1>
            <center>
                <form style="alignment: center">
                    <input type="hidden" name="action" value="search-customer">
                    <table border="1" cellpadding="5">
                        <p>
                            <c:if test='${requestScope["msg"] != null}'>
                                <span class="message" style="color: green">${requestScope["msg"]}</span>
                            </c:if>
                        </p>
                        <tr>
                            <th>ID</th>
                            <th>Code</th>
                            <th>Type</th>
                            <th>Name</th>
                            <th>Day of birth</th>
                            <th>Gender</th>
                            <th>ID Card</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Address</th>
                        </tr>
                        <c:forEach var="customer" items="${listCustomer}">
                            <tr>
                                <td><c:out value="${customer.customerId}"/></td>
                                <td><c:out value="${customer.customerCode}"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${customer.customerTypeId == 1}">Diamond</c:when>
                                        <c:when test="${customer.customerTypeId == 2}">Platinium</c:when>
                                        <c:when test="${customer.customerTypeId == 3}">Gold</c:when>
                                        <c:when test="${customer.customerTypeId == 4}">Silver</c:when>
                                        <c:otherwise>Member</c:otherwise>
                                    </c:choose>
                                </td>
                                <td><c:out value="${customer.customerName}"/></td>
                                <td><c:out value="${customer.customerBirthday}"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${customer.customerGender == 0}">Male</c:when>
                                        <c:when test="${customer.customerGender == 1}">Female</c:when>
                                        <c:otherwise>Other</c:otherwise>
                                    </c:choose>
                                </td>
                                <td><c:out value="${customer.customerIdCard}"/></td>
                                <td><c:out value="${customer.customerPhone}"/></td>
                                <td><c:out value="${customer.customerEmail}"/></td>
                                <td><c:out value="${customer.customerAddress}"/></td>
                            </tr>
                        </c:forEach>
                    </table>
                </form>
            </center>
        </div>
    </div>

</div>
</body>
</html>
