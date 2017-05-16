
var buttons = $("#buttons");
var products = $("#products");

function refreshProducts() {
    $.getJSON("products", function (data) {
        $("tr", products).slice(1).remove();
        $.each(data, function (index, product) {
            var tr = $("<tr/>").appendTo(products);
            tr.append($("<td/>").text(product.name));
            tr.append($("<td/>").text(product.description));
            tr.append($("<td/>").text(product.price + " EUR"));
        });
    });
}

$(document).ready(refreshProducts);

$("<button>Refresh</button>").appendTo(buttons).click(refreshProducts);