<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Shipment</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/add.css">


</head>
<body>


<div class="form-container">
<h2>Add New Shipment</h2>

<c:if test="${sessionScope.role == 'admin'}">
    <div style="position: absolute; top: 20px; right: 30px;">
        <a href="view-shipments">
            <button style="padding: 8px 16px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer;">View Shipments</button>
        </a>
        <a href="${pageContext.request.contextPath}/">
            <button style="padding: 8px 16px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer;" >🏠 Home</button>
        </a>
    </div>
</c:if>

    <form action="save-shipment" method="post">
        <label>Sender Name:</label><br>
        <input type="text" name="senderName" required><br><br>

        <label>Receiver Name:</label><br>
        <input type="text" name="receiverName" required><br><br>
        
      
        

        <label>From Location:</label><br>
        <input type="text" name="fromLocation" required><br><br>

        <label>To Location:</label><br>
        <input type="text" name="toLocation" required><br><br>

        <input type="submit" value="Submit Shipment">
    </form>

</div>
</body>
</html>