<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>$Title$</title>
  <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
  <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light sticky-top bg-secondary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="https://furamavietnam.com/wp-content/uploads/2018/10/logo.png" width="80" height="50" alt="">
    </a>
    <span style="float: right; font-size: 25px"><a href="#" id="name" style="text-decoration: none">Tính </a></span>
  </div>
</nav>
<nav class="navbar navbar-expand-lg navbar-light bg-success sticky-top" style="margin: 5px">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item mx-3 hover-item">
          <a class="nav-link" href="#" style="font-size: 30px; margin-left: 80px">Home</a>
        </li>
        <li class="nav-item hover-item">
          <a class="nav-link " href="#" style="font-size: 30px; padding-left: 30px">Employee</a>
        </li>
        <li class="nav-item hover-item" >
          <a class="nav-link " href="/furama?action=list-customer" style="font-size: 30px; padding-left: 30px">Customer</a>
        </li>
        <li class="nav-item hover-item" >
          <a class="nav-link " href="#" style="font-size: 30px; padding-left: 30px">Service</a>
        </li>
        <li class="nav-item hover-item" >
          <a class="nav-link " href="#" style="font-size: 30px; padding-left: 30px">Contract</a>
        </li>
      </ul>
      <form class="d-flex" style="position: relative">
        <input class="form-control rounded-pill" id="demo-2" type="search" placeholder="Search" aria-label="Search" style="width: 300px; height: 30px; margin-left: 100px; margin-top: 15px">
      </form>
    </div>
  </div>
</nav>

<div class="container-fluid">
  <div class="row">
    <div class="col-lg-2 bg-secondary" >
      <div class="row">
        <div class="col-lg-12 my-lg-1 mx-3">
          <a href="#" style="text-decoration: none; font-size: 25px">GIỚI THIỆU</a>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12 my-lg-1 mx-3">
          <a href="#" style="text-decoration: none; font-size: 25px">SỰ KIỆN</a>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12 my-lg-1 mx-3">
          <a href="#" style="text-decoration: none; font-size: 25px">SPA</a>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12 my-lg-1 mx-3">
          <a href="#" style="text-decoration: none; font-size: 25px">ẨM THỰC</a>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12 my-lg-1 mx-3">
          <a href="#" style="text-decoration: none; font-size: 25px">GIẢI TRÍ</a>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12 my-lg-1 mx-3">
          <a href="#" style="text-decoration: none; font-size: 25px">ƯU ĐÃI</a>
        </div>
      </div>
    </div>
    <div class="col-lg-10" style="margin-bottom: 20px">
      <input type="hidden" name="action" value="">
      <div class="row">
        <div class="col-lg-12">
          <p style="display: flex; flex-direction: column; justify-content: center; color: cadetblue; text-align: center; font-weight: bold; font-size: 30px; margin-top: 15px">
            KHU NGHỈ DƯỠNG ĐẲNG CẤP THẾ GIỚI FURAMA ĐÀ NẴNG, TỰ HÀO LÀ KHU NGHỈ DƯỠNG ẨM THỰC TẠI VIỆT NAM
          </p>

          <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="https://resortdanang.info/wp-content/uploads/2018/11/furama-da-nang.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="https://danangfantasticity.com/wp-content/uploads/2015/12/furama-resort-da-nang-04-1024x768.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="https://magazine.his-j.com/wp-content/uploads/2018/11/1100953.jpg" class="d-block w-100" alt="...">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>

          <p style="display: flex; flex-direction: column; justify-content: center; color: black; text-indent: 25px">
            Hướng ra bãi biển Đà Nẵng trải dài cát trắng, Furama Resort Đà Nẵng là cửa ngõ đến
            với 3 di sản văn hoá thế giới: Hội An (20 phút), Mỹ Sơn (90 phút) và Huế (2 tiếng.
            196 phòng hạng sang cùng với 70 căn biệt thự từ hai đến bốn phòng ngủ có hồ bơi riêng
            đều được trang trí trang nhã, theo phong cách thiết kế truyền thống của Việt Nam và
            kiến trúc thuộc địa của Pháp, biến Furama thành khu nghỉ dưỡng danh giá nhất tại Việt
            Nam – vinh dự được đón tiếp nhiều người nổi tiếng, giới hoàng gia, chính khách, ngôi
            sao điện ảnh và các nhà lãnh đạo kinh doanh quốc tế.
          </p>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid">
  <div class="row text-center" style="background-color: rgba(100,188,170,0.92)">
    <div class="col-lg-12">
      <p style=" display: flex; flex-direction: column; justify-content: center; text-align: center; font-weight: bold; font-size: 20px;
               width: 100%; margin-top: 15px">Liên Hệ</p>
      <p style=" display: flex; flex-direction: column; justify-content: center; text-align: center;
               width: 100%"> 103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District, Danang City, Vietnam</p>
    </div>
  </div>
</div>
</body>
<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
</html>