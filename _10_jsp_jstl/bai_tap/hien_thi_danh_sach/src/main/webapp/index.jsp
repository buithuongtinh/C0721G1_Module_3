
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <style>
      table{
        border: 1px solid black;
        margin: auto;
      }
      tr,td{
        border: 1px solid black;

      }
      td{
        width: 100px;
        font-weight: bold;
      }
      h1{
        text-align: center;
      }
    </style>
  </head>
  <body>
  <table>
    <tr><h1>Danh sách Khách Hàng</h1></tr>
    <tr>
      <th>Tên</th>
      <th>Ngày Sinh</th>
      <th>Địa Chỉ</th>
      <th>Ảnh</th>
    </tr>
    <c:forEach items="${customerList}" var="customer">
      <tr>
        <td>${customer.nameCustomer}</td>
        <td>${customer.dateOfBirth}</td>
        <td>${customer.address}</td>
        <td>
          <img src="/img/${customer.image}" width="50" height="50">
        </td>

      </tr>
    </c:forEach>

  </table>

  </body>
</html>
