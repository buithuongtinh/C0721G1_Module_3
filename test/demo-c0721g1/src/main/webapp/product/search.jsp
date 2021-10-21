<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Search product</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">

</head>
<body>
<div class="container-fluid">
    <jsp:include page="../common/header-navbar.jsp"></jsp:include>
    <div class="row">
        <div class="col-2 bg-light">
            <jsp:include page="../common/left-sidebar.jsp"></jsp:include>
        </div>

        <div class="col-10">
            <div class="row mt-2 mb-2">
                <div class="col-3">
                    <a href="/product" class="btn btn-dark">Back to list all product</a>
                </div>
            </div>
            <form method="post">
                <c:if test="${search.equals('name')}">
                    <div class="row mt-2">
                        <div class="col-6">
                            <h3>Please enter name of product: </h3>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-6">
                            <input type="text" class="form-control" name="name">
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-2">
                            <input type="submit" class="form-control btn btn-primary" value="Search">
                        </div>
                    </div>
                </c:if>
                <c:if test="${search.equals('category')}">
                    <div class="row mt-2">
                        <div class="col-6">
                            <h3>Please select category of product: </h3>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-6">
                            <select class="form-select" aria-label="Default select example" name="categoryId">
                                <option selected>Select category</option>
                                <c:forEach items="${categoryList}" var="category">
                                    <option value="${category.idCategory}">${category.nameCategory}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-2">
                            <input type="submit" class="form-control btn btn-primary" value="Search">
                        </div>
                    </div>
                </c:if>

                <c:if test="${empty productList}">
                    <h3 class="text-danger">
                        <c:if test='${requestScope["message"] != null}'>
                            <span class="message">${requestScope["message"]}</span>
                        </c:if>
                    </h3>
                </c:if>
                <c:if test="${not empty productList}">
                    <h3>
                        <c:if test='${requestScope["message"] != null}'>
                            <span class="message">${requestScope["message"]}</span>
                        </c:if>
                    </h3>
                    <table class="table table-striped" id="tableProduct">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Color</th>
                            <th>Description</th>
                            <th>Category Id</th>
                            <th>Category Name</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope['productList']}" var="product">
                            <tr>
                                <td>${product.id}</td>
                                <td>${product.name}</td>
                                <td>${product.price}</td>
                                <td>${product.quantity}</td>
                                <td>${product.color}</td>
                                <td>${product.description}</td>
                                <td>${product.categoryId}</td>
                                <td>${product.categoryName}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
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
    $(document).ready(function () {
        $("#tableProduct").DataTable ({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        })
    })
</script>
</body>
</html>