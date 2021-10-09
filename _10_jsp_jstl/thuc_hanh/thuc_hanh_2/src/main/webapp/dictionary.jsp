<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 10/7/2021
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Map<String, String> dictionaryMap = new HashMap<>();
    dictionaryMap.put("book", "Sách");
    dictionaryMap.put("how", "Thế nào");
    dictionaryMap.put("book", "Quyển vở");
    dictionaryMap.put("computer", "Máy tính");
    String search = request.getParameter("search");
    String result = dictionaryMap.get(search);
    if (result == null){
        out.println("Not found");
    }else {
        out.println("Word: " + search);
        out.println("Result: " + result);
    }
%>
</body>
</html>
