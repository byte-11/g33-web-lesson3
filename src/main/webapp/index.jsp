<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<br>
<a href="/auth">Login</a>
<ul>
    <%--    <%int number = 1;%>--%>
    <c:set var="number" value="1"></c:set>

    <%--For statement--%>
    <c:forEach var="i" begin="1" end="10" step="1" varStatus="status">
        <li>${number} - ${status.index}</li>
    </c:forEach>


    <%--If statement--%>
    <c:if test="${1 == 1}">
        <p>1 is equal to 1</p>
    </c:if>


    <%-- If else statemetns --%>
    <c:choose>
        <c:when test="${1 == 1}"> <%--if--%>
            <p>1 == 1</p>
        </c:when>
        <c:when test="${1 == 1}"> <%--if else--%>
            <p>1 == 1</p>
        </c:when>
        <c:otherwise> <%--else--%>
            <p>1 is not equal </p>
        </c:otherwise>
    </c:choose>


</ul>
</body>
</html>

<%--
ge => >=
le => <=
gt => >
lt =< <
eq => ==
ne => !=
--%>