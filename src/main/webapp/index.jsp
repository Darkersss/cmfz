<%@page contentType="text/html;UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<c:forEach items="${requestScope.map.rows}" var="admin">
    ${admin.total}
    <c:forEach items="${admin.rows}" var="aa">
        ${aa.title}
    </c:forEach>
</c:forEach>
<h2>小黑黑</h2>
</body>
</html>
