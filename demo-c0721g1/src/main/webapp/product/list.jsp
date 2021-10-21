<%--
  Created by IntelliJ IDEA.
  User: LinhDN
  Date: 10/13/2021
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-3">
            <jsp:include page="../common/left-sidebar.jsp"></jsp:include>
        </div>
        <div class="col-9">
            <a href="/product?action=create" class="btn btn-success"> Thêm mới</a>
            <c:if test="${message != null}">
                <p class="text-danger">${message}</p>
            </c:if>
            <table id="product" class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">Mã sản phẩm</th>
                    <th scope="col">Tên sản phẩm</th>
                    <th scope="col">Giá</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Danh mục</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${productList}">
                    <tr>
                        <td >${product.idProduct}</td>
                        <td >${product.nameProduct}</td>
                        <td >${product.price}</td>
                        <td >${product.status ? 'còn hàng':'hết hàng'}</td>
                        <td >${product.nameCategory}</td>
                        <td>
                            <button class="btn btn-warning">Sửa</button>
                            <button onclick="setValueFormDelete('${product.idProduct}', '${product.nameProduct}')" class="btn btn-danger" data-toggle="modal" data-target="#modalDelete">Xoá</button>
                            <input type="checkbox">
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
                <button class="btn btn-danger">xoá những sản phẩm được chọn</button>
            </table>
        </div>
    </div>
</div>
<!-- Modal delete-->
<div class="modal fade" id="modalDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" id="formDelete" action="/product?action=delete" hidden>
                    <input type="text" name="idProduct" id="idProduct">
                </form>
                Bạn có chắc muốn xoá sản phẩm <span class="text-danger" id="nameProduct"></span> ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-danger" onclick="submitForm()">Xoá</button>
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
        $('#product').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
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
