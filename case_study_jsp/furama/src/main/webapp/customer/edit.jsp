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
            <h1 style="text-align: center">Editing Customer</h1>
            <center>
                <p>
                    <c:if test='${requestScope["msg"] != null}'>
                        <span class="message" style="color: blue; font-weight: bold; text-align: center">${requestScope["msg"]}</span>
                    </c:if>
                </p>
                <form method="post" style="alignment: center">
                    <input type="hidden" name="action" value="edit-customer">
                    <table border="1" cellpadding="5">
                        <c:if test="${customer != null}">
                            <input type="hidden" name="id" value="<c:out value='${customer.customerId}' />"/>
                        </c:if>
                        <tr>
                            <th>Customer ID</th>
                            <td>
                                <input type="text" name="id"
                                       value="<c:out value='${customer.customerId}' />"
                                />
                            </td>
                        </tr>
                        <tr>
                            <th>Customer code: (KH-XXXX)</th>
                            <td>
                                <input type="text" name="code"
                                       value="<c:out value='${customer.customerCode}' />"
                                />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="color: #a71d2a"  class="rounded-pill">
                                <c:if test="${map.get('code') != null}">
                                    <small>${map.get('code')}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Customer type:</th>
                            <td>
                                <select name="type" style="width: 182px">
                                    <c:forEach var="customerType" items="${typeList}">
                                        <c:choose>
                                            <c:when test="${customer.customerTypeId == customerType.customerTypeId}">
                                                <option value="${customerType.customerTypeId}" selected>${customerType.customerTypeName}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${customerType.customerTypeId}" >${customerType.customerTypeName}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>Name:</th>
                            <td>
                                <input type="text" name="name"
                                       value="<c:out value='${customer.customerName}' />"
                                />
                            </td>
                        </tr>
                        <tr>
                            <th>Birthday:</th>
                            <td>
                                <input type="text" name="dob"
                                       value="<c:out value='${customer.customerBirthday}' />"
                                />
                            </td>
                        </tr>
                        <tr>
                            <th>Gender:</th>
                            <td>
                                <select name="gender" style="width: 182px">
                                    <option selected>Choose one</option>
                                    <option value="0">Male</option>
                                    <option value="1">Female</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>ID Card:</th>
                            <td>
                                <input type="text" name="card"
                                       value="<c:out value='${customer.customerIdCard}' />"
                                />
                            </td>
                        </tr>
                        <tr>
                            <th>Phone:</th>
                            <td>
                                <input type="text" name="phone"
                                       value="<c:out value='${customer.customerPhone}' />"
                                />
                            </td>
                        </tr>
                        <tr>
                            <th>Email:</th>
                            <td>
                                <input type="text" name="email"
                                       value="<c:out value='${customer.customerEmail}' />"
                                />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="color: #a71d2a" class="rounded-pill">
                                <c:if test="${map.get('email') != null}">
                                    <small>${map.get('email')}</small>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>Address:</th>
                            <td>
                                <input type="text" name="address"
                                       value="<c:out value='${customer.customerAddress}' />"
                                />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td align="center" class="rounded-pill" style="width: 150px">
                                <input class="rounded-pill" style="width: 100px" type="submit" value="Save"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </center>
        </div>
    </div>
</div>

</body>
</html>
