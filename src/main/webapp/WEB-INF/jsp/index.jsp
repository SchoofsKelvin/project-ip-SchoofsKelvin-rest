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
            .divider {
                width: 100%;
                height: 2px;
                background: #555;
                margin: 10px 0;
            }
        </style>
    </head>
    <body>
        <h1>Documentation</h1>
        <jsp:include page="memberdoc.jsp">
            <jsp:param name="method" value="GET" />
            <jsp:param name="url" value="/products" />
            <jsp:param name="description" value="Returns all products (with their name, description, price and productid)"/>
            <jsp:param name="statuses" value="
                       HttpStatus 200 OK: A list of all products is returned"/>
        </jsp:include>
        <jsp:include page="memberdoc.jsp">
            <jsp:param name="method" value="GET" />
            <jsp:param name="url" value="/products/{id}" />
            <jsp:param name="description" value="Returns the product with the given productid"/>
            <jsp:param name="statuses" value="
                       HttpStatus 200 OK: A list of all products is returned
                       HttpStatus 404 NOT FOUND: The given product doesn't exist"/>
        </jsp:include>
        <jsp:include page="memberdoc.jsp">
            <jsp:param name="method" value="POST" />
            <jsp:param name="url" value="/products" />
            <jsp:param name="description" value="Creates a new product with the given name, description and price and returns it"/>
            <jsp:param name="statuses" value="
                       HttpStatus 200 CREATED: The product is succesfully created
                       HttpStatus 400 BAD REQUEST: You did something wrong, error message is in the body"/>
        </jsp:include>
        <jsp:include page="memberdoc.jsp">
            <jsp:param name="method" value="PUT" />
            <jsp:param name="url" value="/products/{id}" />
            <jsp:param name="description" value="Similar to creating a product, instead this updates one. ProductId in the body is ignored."/>
            <jsp:param name="statuses" value="
                       HttpStatus 200 CREATED: The product is succesfully created
                       HttpStatus 400 BAD REQUEST: You did something wrong, error message is in the body
                       HttpStatus 404 NOT FOUND: The given product doesn't exist"/>
        </jsp:include>
        <jsp:include page="memberdoc.jsp">
            <jsp:param name="method" value="DELETE" />
            <jsp:param name="url" value="/products/{id}" />
            <jsp:param name="description" value="Removes the product with the given ProductId. Sending a body results in a Bad Request"/>
            <jsp:param name="statuses" value="
                       HttpStatus 200 CREATED: The product is succesfully created
                       HttpStatus 400 BAD REQUEST: You did something wrong, error message is in the body
                       HttpStatus 404 NOT FOUND: The given product doesn't exist"/>
        </jsp:include>
    </body>
</html>
