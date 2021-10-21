
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <div class="col-3">
            <jsp:include page="../common/left-sidebar.jsp"></jsp:include>
        </div>
        <div class="col-9">
            <form action="/product?action=create" method="post">
                <div class="form-group">
                    <label for="name-product">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="name-product" name="nameProduct">
                </div>
                <div class="form-group">
                    <label for="price">Giá</label>
                    <input type="text" class="form-control" id="price" name="price">
                </div>
                <div class="form-group">
                    <label for="status">Example multiple select</label>
                    <select class="form-control" id="status" name="status">
                        <option value="true">Còn hàng</option>
                        <option value="false">Hết hàng</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="category">Example multiple select</label>
                    <select class="form-control" id="category" name="idCategory">
                        <c:forEach var="category" items="${categoryList}">
                            <option value="${category.idCategory}">${category.nameCategory}</option>
                        </c:forEach>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>

<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
</body>
</html>
