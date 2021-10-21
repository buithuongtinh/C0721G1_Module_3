<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">

</head>
<body >
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
            <h1 style="text-align: center">Create New Customer</h1>
            <center>
                <p>
                    <c:if test='${requestScope["msg"] != null}'>
                        <span class="message" style="color: blue; font-weight: bold; text-align: center">${requestScope["msg"]}</span>
                    </c:if>
                </p>
                <form method="post" style="alignment: center">
                    <input type="hidden" name="action" value="create-customer">
                    <table align="center">
                        <tr>
                            <td>Code: </td>
                            <td class="rounded-pill">
                                <input type="text" name="code" value="${newCustomer.getCustomerCode()}">
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
                            <td>Type ID:</td>
                            <td  class="rounded-pill">
                                <select name="type" style="width: 182px">
                                    <c:forEach var="customerType" items="${typeList}">
                                        <option value='${customerType.customerTypeId}' >${customerType.customerTypeName}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Name:</td>
                            <td  class="rounded-pill">
                                <input type="text" name="name">
                            </td>
                        </tr>
                        <tr>
                            <td>Day of birth:</td>
                            <td class="rounded-pill">
                                <input type="text" name="dob">
                            </td>
                        </tr>
                        <tr>
                            <td>Gender:</td>
                            <td class="rounded-pill">
                                <select name="gender" style="width: 182px">
                                    <option selected>Choose one</option>
                                    <option value="0">Male</option>
                                    <option value="1">Female</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>ID Card:</td>
                            <td class="rounded-pill">
                                <input type="text" name="card">
                            </td>
                        </tr>
                        <tr>
                            <td>Phone number:</td>
                            <td class="rounded-pill">
                                <input type="text" name="phone">
                            </td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td class="rounded-pill">
                                <input type="text" name="email" value="${newCustomer.getCustomerEmail()}">
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
                            <td>Address:</td>
                            <td class="rounded-pill">
                                <input type="text" name="address">
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="rounded-pill">
                                <button class="rounded-pill my-lg-1" type="submit" style="width: 160px; height: 35px">Create</button>
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