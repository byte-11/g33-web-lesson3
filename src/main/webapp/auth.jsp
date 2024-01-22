<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! private static int num = 1; %>
<html>
<head>
    <title>Login</title>
    <style>
        label {
            display: block;
            margin: 20px;
        }
    </style>
</head>
<body>
<%-- /auth --%>
<div class="container">
    <c:choose>
        <c:when test="${param.action eq null or param.action eq 'login'}">
            <form action="${pageContext.request.contextPath}/auth?action=login" method="post">
                <label>
                    Email : <input type="email" name="email">
                </label>
                <label>
                    Password : <input type="password" name="password">
                </label>
                <label>
                    Time : <input type="time">
                </label>
                <label>
                    <input type="submit" value="Login">
                </label>
            </form>
        </c:when>
        <c:otherwise>
            <form action="${pageContext.request.contextPath}/auth?action=signup" method="post">
                <label>
                    Username : <input type="text" name="username">
                </label>
                <label>
                    Email : <input type="email" name="email">
                </label>
                <label>
                    Password : <input type="password" name="password">
                </label>
                <label>
                    <input type="submit" value="SignUp">
                </label>
            </form>
        </c:otherwise>
    </c:choose>
</div>
<%--<c:out value="${requestScope.get('error')}"></c:out>--%>
<%--<c:out value="${requestScope.error}"></c:out>--%>
<c:if test="${not empty requestScope.error}">
    <div class="error">
        <p style="color: orangered" >${requestScope.error}</p>
    </div>
</c:if>
<div>
    <a href="${pageContext.request.contextPath}/auth?action=login">Login</a>
    <span>   or  </span>
    <a href="${pageContext.request.contextPath}/auth?action=signup">SignUp</a>
</div>
<div >${sessionScope.user}</div>
</body>
</html>

<%--
// auth?action=login
// request -> /auth
   // parmeter -> action:login
   http://localhost:8080/auth?action=login
--%>