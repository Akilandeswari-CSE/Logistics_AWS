<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Sign Up</title></head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/signup.css">

<body>
<div>
    <h2>Sign Up</h2>
    <form action="signup" method="post">
        Username: <input type="text" name="username" required /><br><br>
        Password: <input type="password" name="password" required /><br><br>
        Role:
        <select name="role">
            <option value="admin">Admin</option>
            <option value="user">User</option>
        </select><br><br>
        <input type="submit" value="Register" />
    </form>
    <c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>
  </div>  
</body>
</html>
