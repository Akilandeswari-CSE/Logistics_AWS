<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Track Shipment</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/track.css">
    
</head>
<body>
    <h2>🔎 Track Your Shipment</h2>

    <!-- PART 1: Get Tracking ID -->
   <form action="get-tracking-id" method="post">
    <label>Receiver Name:</label><br>
    <input type="text" name="receiverName" value="${receiverName}" required><br><br>

    <label>To Location:</label><br>
    <input type="text" name="toLocation" value="${toLocation}" required><br><br>

    <input type="submit" value="Get My Tracking ID">
</form>

    <c:if test="${not empty trackingIdFound}">
        <p>✅ Your Tracking ID: <strong>${trackingIdFound}</strong></p>
    </c:if>
    <c:if test="${not empty errorId}">
        <p style="color:red;">${errorId}</p>
    </c:if>

    <hr>

    <!-- PART 2: Track Using ID -->
   <form action="track-shipment" method="post">
    <label>Tracking ID:</label><br>
    <input type="text" name="trackingId" value="${trackingIdFound}" required><br><br>

    <label>Receiver Name:</label><br>
    <input type="text" name="receiverName" value="${receiverName}" required><br><br>

    <input type="submit" value="Track">
</form>
   

    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>

</body>
</html>


<!--  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Track Shipment</title>
</head>
<body>
    <h2>Track Your Shipment</h2>
    <form action="track-shipment" method="post">
        <label>Tracking ID:</label><br>
        <input type="text" name="trackingId" required><br><br>

        <label>Receiver Name:</label><br>
        <input type="text" name="receiverName" required><br><br>

        <input type="submit" value="Track">
    </form>

    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>
</body>
</html>
-->