<%-- any content can be specified here e.g.: --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<div>
    <h2><span class="bold">${param.method}</span> <a href="<c:url value="${param.url}" />">${param.url}</a></h2>
    <p>${param.description}</p>
</div>