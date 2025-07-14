<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Shipment Status</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/update.css">
    
</head>
<body>
    <h2>Update Shipment Status</h2>
    <form action="/update-shipment" method="post">
        <input type="hidden" name="id" value="${shipment.id}" />
        <input type="hidden" name="trackingId" value="${shipment.trackingId}" />
        <input type="hidden" name="senderName" value="${shipment.senderName}" />
        <input type="hidden" name="receiverName" value="${shipment.receiverName}" />
        <input type="hidden" name="fromLocation" value="${shipment.fromLocation}" />
        <input type="hidden" name="toLocation" value="${shipment.toLocation}" />
        <input type="hidden" name="bookingDate" value="${shipment.bookingDate}" />

        <label>Status:</label>
        <select name="status">
            <option value="Pending" <c:if test="${shipment.status eq 'Pending'}">selected</c:if>>Pending</option>
            <option value="Shipped" <c:if test="${shipment.status eq 'Shipped'}">selected</c:if>>Shipped</option>
            <option value="Delivered" <c:if test="${shipment.status eq 'Delivered'}">selected</c:if>>Delivered</option>
        </select>
        <br><br>

        <input type="submit" value="Update Status" />
    </form>
</body>
</html>
