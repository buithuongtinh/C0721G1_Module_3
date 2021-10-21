<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">

</head>
<body >
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item mx-3 hover-item">
                <a class="nav-link" href="/" style="font-size: 30px; margin-left: 80px">Home</a>
            </li>
        </ul>
        <form class="d-flex" method="post" action="/furama?action=search-customer" style="position: relative">
            <input class="form-control rounded-pill w-75" name="customerName" id="demo-2" type="search" placeholder="Search customer name" aria-label="Search" style="width: 100px; height: 30px; margin-left: 100px; margin-top: 15px">
            <input class="form-control rounded-pill w-75" name="customerAddress" id="demo-3" type="search" placeholder="Search customer address" aria-label="Search" style="width: 100px; height: 30px; margin-left: 100px; margin-top: 15px">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <input type="hidden" name="action" value="list-customer">
            <center>
                <h1>Customer Management</h1>
                <h2>
                    <a href="${pageContext.request.contextPath}/furama?action=create-customer">Add New Customer</a>
                    <caption><h2>List of Customer</h2></caption>
                    <p>
                        <c:if test='${requestScope["msg"] != null}'>
                            <span class="message" style="color: red; font-style: italic; font-size: 20px">${requestScope["msg"]}</span>
                        </c:if>
                    </p>
                </h2>
            </center>
            <div align="center">
                <c:if test="${empty listCustomer}">
                    <h3 style="color: red">Customer List Empty!</h3>
                </c:if>
                <c:if test="${not empty listCustomer}">
                    <table style="margin-bottom: 30px; width: 100%" id="tableCustomer" class="table table-striped table-bordered">
                        <thead>
                        <tr style="text-align: center">
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
                            <th colspan="2">Action</th>
                        </tr>
                        </thead>
                        <tbody>
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
                                <td>
                                    <button style="background-color: rgba(182,201,170,0.82); width: 70px" type="button" class="btn rounded-pill"><a href="/furama?action=edit-customer&id=${customer.customerId}">Edit</a></button>
                                    <button style="background-color: rgba(188,49,55,0.92)" onclick="onDelete('${customer.customerId}', '${customer.customerName}')" type="button" class="btn rounded-pill" data-toggle="modal" data-target="#modelId">Delete</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirm delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form>
                <input type="hidden" name="action" value="delete-customer">
                <input type="hidden" name="id" value="" id="idCustomerDelete">
                <div class="modal-body">
                    Bạn có chắc chắn muốn xoá <input style="border: none; outline: none; font-weight: bold" id="nameCustomerDelete" readonly>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
                </div>
            </form>
        </div>
    </div>
</div>



<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>

<script>
    function onDelete(id, name) {
        document.getElementById("idCustomerDelete").value = id;
        console.log(name)
        document.getElementById("nameCustomerDelete").value = name;
    }
    $(document).ready(function () {
        $('#tableCustomer').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } )
    } )
</script>

</body>
</html>