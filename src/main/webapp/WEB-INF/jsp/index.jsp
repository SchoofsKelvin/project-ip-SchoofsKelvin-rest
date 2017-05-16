<%--
    Document   : index
    Created on : May 16, 2017, 3:40:54 PM
    Author     : Kelvin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REST API</title>
        <style>
            h2, h2 > p {
                display: inline-block;
                margin: 5px;
            }
            .bold {
                font-weight: bold;
            }
            a {
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <h1>Documentation</h1>
        <jsp:include page="memberdoc.jsp">
            <jsp:param name="method" value="GET" />
            <jsp:param name="url" value="/products" />
            <jsp:param name="description" value="Returns all products (with their name, description, price and productid)"/>
        </jsp:include>
        <jsp:include page="memberdoc.jsp">
            <jsp:param name="method" value="POST" />
            <jsp:param name="url" value="/products" />
            <jsp:param name="description" value="Creates a new product with the given name, description and price and returns it"/>
        </jsp:include>
    </body>
</html>
