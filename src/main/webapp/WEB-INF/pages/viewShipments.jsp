<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Shipments</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/view.css">
<style>
    .back-button {
        margin-top: 20px;
        text-align: center; /* Center align the content */
    }

    .back-button button {
        padding: 10px 20px;
        background-color: #2ecc71;
        color: white;
        border: none;
        border-radius: 6px;
        font-weight: bold;
        cursor: pointer;
    }

    .back-button button:hover {
        background-color: #27ae60;
    }
</style>


</head>
<body>
  <h2>Shipment Records</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Tracking ID</th>
            <th>Sender</th>
            <th>Receiver</th>
            <th>From</th>
            <th>To</th>
            <th>Status</th>
            <th>Booking Date</th>
            <th>Action</th>
        </tr>
        <c:forEach var="s" items="${shipments}">
            <tr>
                <td>${s.id}</td>
                <td>${s.trackingId}</td>
                <td>${s.senderName}</td>
                <td>${s.receiverName}</td>
                <td>${s.fromLocation}</td>
                <td>${s.toLocation}</td>
                <td>${s.status}</td>
                <td>${s.bookingDate}</td>
                <td>
                    <a href="update-shipment/${s.id}">Update</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br>
<div class="back-button">
    <a href="${pageContext.request.contextPath}/add-shipment">
        <button>⬅ Back to Add Shipment</button>
    </a>
</div>
    
  
</body>
</html>