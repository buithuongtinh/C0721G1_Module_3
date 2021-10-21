<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create product</title>
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
                    <a href="/matbang" class="btn btn-dark">Back to list</a>
                </div>
            </div>
            <div class="row mt-2 mb-2">
                <div class="col-4">
                    <h4>
                        <c:if test='${requestScope["message"] != null}'>
                            <span class="message">${requestScope["message"]}</span>
                        </c:if>
                    </h4>
                </div>
            </div>
            <form method="post" action="/matBang?action=create">
                <legend>Mb</legend>
                <div class="row mt-2">
                    <div class="col-5">
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Name</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="name" value="${name}" aria-describedby="nameError">
                                <c:if test="${mapMessage.get('name') != null}">
                                    <small id="nameError" class="form-text text-danger">${mapMessage.get('name')}</small>
                                </c:if>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Price</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="price" value="${price}" aria-describedby="priceError">
                                <c:if test="${mapMessage.get('price') != null}">
                                    <small id="priceError" class="form-text text-danger">${mapMessage.get('price')}</small>
                                </c:if>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Quantity</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="quantity" value="${quantity}" aria-describedby="quantityError">
                                <c:if test="${mapMessage.get('quantity') != null}">
                                    <small id="quantityError" class="form-text text-danger">${mapMessage.get('quantity')}</small>
                                </c:if>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Color</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="color" value="${color}" aria-describedby="colorError">
                                <c:if test="${mapMessage.get('color') != null}">
                                    <small id="colorError" class="form-text text-danger">${mapMessage.get('color')}</small>
                                </c:if>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Description</label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" name="description" value="${description}" aria-describedby="descriptionError">
                                <c:if test="${mapMessage.get('description') != null}">
                                    <small id="descriptionError" class="form-text text-danger">${mapMessage.get('description')}</small>
                                </c:if>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                                <label class="col-form-label">Category name</label>
                            </div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example" name="categoryId" required>
                                    <option value="">Select category</option>
                                    <c:forEach items="${categoryList}" var="category">
                                        <c:choose>
                                            <c:when test="${category.idCategory == categoryId}">
                                                <option value="${category.idCategory}" selected>${category.nameCategory}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${category.idCategory}">${category.nameCategory}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-4">
                            </div>
                            <div class="col-6">
                                <input type="submit" class="form-control btn btn-primary" value="Create">
                            </div>
                        </div>
                    </div>
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


</body>
</html>
