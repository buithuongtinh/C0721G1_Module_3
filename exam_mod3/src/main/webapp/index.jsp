<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>List Product</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
  <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">

</head>
<body>
<div class="container-fluid">
  <jsp:include page="common/header-navbar.jsp"></jsp:include>
  <div class="row">
    <div class="col-2 bg-light">
      <jsp:include page="common/left-sidebar.jsp"></jsp:include>
    </div>

    <div class="col-10">
      <div class="row mt-2 mb-2">
        <div class="col-4">
          <h1>Quản Lý Mặt Bằng</h1>
        </div>
      </div>
      <div class="row mt-2 mb-2">
        <div class="col-3">
          <a href="/matBang?action=create" class="btn btn-primary">Create new Mat bang</a>
        </div>
        <div class="col-3">
          <a href="/matBang?action=search&search=name" class="btn btn-primary">Search product by name</a>
        </div>
        <div class="col-3">
          <a href="/matBang?action=search&search=tang" class="btn btn-primary">Search product by tang</a>
        </div>
        <div class="col-3">
          <a href="/matBang" class="btn btn-primary">list all matBang</a>
        </div>
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


</body>
</html>