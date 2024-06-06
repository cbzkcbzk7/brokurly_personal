<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<spring:hasBindErrors name="validation">
    <c:if test="${errors.hasFieldErrors('id')}">
        <spring:message text="${errors.getFieldError('id').defaultMessage}"/>
    </c:if>
    <c:if test="${errors.hasFieldErrors('name')}">
        <spring:message text="${errors.getFieldError('name').defaultMessage}"/>
    </c:if>
    <c:if test="${errors.hasFieldErrors('email')}">
        <spring:message text="${errors.getFieldError('email').defaultMessage}"/>
    </c:if>
</spring:hasBindErrors>
</body>
</html>