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
            th,td {
                padding: 0.6em 1.2em 0 0;
                text-align: left;
                vertical-align: top;
            }
            label {
                width: 100px;
                display: inline-block;
            }
            button {
                margin: 5px 0;
            }
        </style>
    </head>
    <body>
        <h1>REST Panel</h1>
        <div id="buttons"></div>
        <div>
            <table>
                <tbody id="products">
                    <tr><th>Name</th><th>Description</th><th>Price</th><th>Actions</th></tr>
                </tbody>
            </table>
        </div>
        <p id="status" style="font-weight: bold;"></p>
        <form id="form">
            <p>
                <label for="name">Naam</label>
                <input id="name" name="name" type="text" value="">

            </p>
            <p>
                <label for="name">Beschrijving</label>
                <input id="description" name="description" type="text" value="">

            </p>
            <p>
                <label for="name">Prijs (EUR)</label>
                <input id="price" name="price" step="0.01" type="text" value="">

            </p>
            <p id="formstatus">Creating a new product</p>
            <input id="submit" type="submit" value="Create">
            <button id="reset">Reset</button>
            <input id="productid" name="productid" type="hidden" value="">
        </form>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="js/panel.js"></script>
    </body>
</html>