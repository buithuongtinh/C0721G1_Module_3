<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>List Product</title>
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
                    <a href="/" class="btn btn-primary">Home</a>
                </div>
                <div class="col-3">
                    <a href="/product?action=create" class="btn btn-primary">Create new product</a>
                </div>
                <div class="col-3">
                    <a href="/product?action=search&search=name" class="btn btn-primary">Search product by name</a>
                </div>
                <div class="col-3">
                    <a href="/product?action=search&search=category" class="btn btn-primary">Search product by category</a>
                </div>
            </div>
            <div class="row mt-2 mb-2">
                <div class="col-4">
                    <h4>List all product</h4>
                </div>
            </div>
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
                    <th>Edit</th>
                    <th>Delete</th>
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
                        <td>
                            <a href="/product?action=edit&id=${product.id}" class="btn btn-warning">Edit</a>
                        </td>
                        <td>
                            <button onclick="setValueFormDelete('${product.id}', '${product.name}')"
                                    class="btn btn-danger" data-toggle="modal" data-target="#modalDelete">
                                Delete
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Modal delete-->
<div class="modal fade" id="modalDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Confirm delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" id="formDelete" action="/product?action=delete" hidden>
                    <input type="text" name="idProduct" id="idProduct">
                </form>
                Are you sure delete this product <span class="text-danger" id="nameProduct"></span> ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" onclick="submitForm()">Yes</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
            </div>
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
<script>
    function setValueFormDelete(idProduct, nameProduct) {
        document.getElementById("idProduct").value = idProduct;
        document.getElementById("nameProduct").innerText = nameProduct;
    }
    function submitForm() {
        document.getElementById("formDelete").submit();
    }
</script>
</body>
</html>