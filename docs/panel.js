
/* global hljs */

const url = $("#url");
const buttons = $("#buttons");
const products = $("#products");
const status = $("#status");

hljs.configure({useBR: true});
const setStatus = (txt) => (status.text(txt), hljs.highlightBlock(status[0]));

function refreshProducts() {
    setStatus("Refreshing...");
    $.ajax(url.val() + "/products", {success: function (data) {
            setStatus("Refreshed: " + JSON.stringify(data));
            $("tr", products).slice(1).remove();
            $.each(data, function (index, product) {
                var tr = $("<tr/>").appendTo(products);
                var n = $("<td/>").text(product.name);
                var d = $("<td/>").text(product.description);
                var p = $("<td/>").text(product.price + " EUR");
                tr.append(n, d, p);
                $("<button/>").appendTo(tr).text("Select").click(() => selectProduct(product));
                $("<button/>").appendTo(tr).text("Delete").click(() => deleteProduct(product));
                $("<button/>").appendTo(tr).text("Refresh").click(() => {
                    $.ajax("products/" + product.productid, {
                        success: (data) => {
                            n.text(data.name);
                            d.text(data.description);
                            p.text(data.price + " EUR");
                        }, dataType: "json", error: (xhr, stat, err) => (setStatus(err + ": " + xhr.responseText), tr.remove())
                    });
                });
            });
        }, error: (xhr, stat, err) => setStatus(err + ": " + xhr.responseText)});
}

$(document).ready(refreshProducts);

$("<button>Refresh</button>").appendTo(buttons).click(refreshProducts);

function deleteProduct(product) {
    setStatus("Deleting " + product.name);
    $.ajax(url.val() + "/products/" + product.productid, {
        method: "delete",
        error: (xhr, stat, err) => setStatus(err + ": " + xhr.responseText),
        success: (data) => setStatus("Ok: " + data)
    });
}

const form = $("#form");
const name = $("#name");
const description = $("#description");
const price = $("#price");
const productid = $("#productid");
const formstatus = $("#formstatus");
const reset = $("#reset");
const submit = $("#submit");

function selectProduct(product) {
    submit.val("Update");
    formsetStatus("Updating product with id " + product.productid);
    form.show();
    name.val(product.name);
    description.val(product.description);
    price.val(product.price);
    productid.val(product.productid);
}

function sendProduct(method) {
    $.ajax(url.val() + "/products/" + productid.val(), {
        method: method,
        contentType: "application/json",
        data: JSON.stringify({
            name: name.val(),
            description: description.val(),
            price: price.val()
        }),
        error: (xhr, stat, err) => setStatus(err + ": " + xhr.responseText),
        success: (data) => setStatus("Ok: " + JSON.stringify(data))
    });
    return false;
}

form.submit(() => sendProduct(productid.val() ? "put" : "post"));
reset.click((e) => {
    e.preventDefault();
    submit.text("Create");
    formsetStatus("Creating a new product");
    productid.val(null);
    name.val(null);
    price.val(null);
    description.val(null);
}
);