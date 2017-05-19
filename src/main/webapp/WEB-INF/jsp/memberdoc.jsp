<%-- any content can be specified here e.g.: --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n");%>
<%@ page pageEncoding="UTF-8" %>
<div class="divider"></div>
<div>
    <h2><span class="bold">${param.method}</span> <a href="<c:url value="${param.url}" />">${param.url}</a></h2>
    <p>${param.description}</p>
    <p><%=request.getParameter("statuses").replaceFirst("\n", "").replaceAll("\n", "<br/>")%></p>
</div>