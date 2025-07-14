<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shipment Details</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/view2.css">
   
   
</head>
<body>

  <c:if test="${sessionScope.role == 'user'}">
    <div style="position: absolute; top: 20px; right: 30px;">
        <a href="login">
            <button style="padding: 8px 16px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer;">Logout</button>
        </a>
        <a href="${pageContext.request.contextPath}/">
            <button style="padding: 8px 16px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer;" >🏠 Home</button>
        </a>
    </div>
</c:if>
<div>
    <h2>Shipment Tracking Result</h2>
    <table border="1" cellpadding="10">
        <tr><th>Tracking ID</th><td>${shipment.trackingId}</td></tr>
        <tr><th>Sender</th><td>${shipment.senderName}</td></tr>
        <tr><th>Receiver</th><td>${shipment.receiverName}</td></tr>
        <tr><th>From</th><td>${shipment.fromLocation}</td></tr>
        <tr><th>To</th><td>${shipment.toLocation}</td></tr>
        <tr><th>Status</th><td>${shipment.status}</td></tr>
        <tr><th>Booking Date</th><td>${shipment.bookingDate}</td></tr>
    </table>
    </div>
</body>
</html>
