<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Login</title></head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">

<body>
<div>
    <h2>Login</h2>
    <form action="login" method="post">
        Username: <input type="text" name="username" required /><br><br>
        Password: <input type="password" name="password" required /><br><br>
        <input type="submit" value="Login" />
    </form>
    <p>New user? <a href="signup">Sign Up</a></p>
    <p style="color:red;">${error}</p>
    </div>
</body>
</html>
