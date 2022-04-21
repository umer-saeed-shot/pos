function calculateMiscPrice(value) {
    var qty = $("#misc_qty").val();
    var total_price = $("#misc_total_price");
    var total = parseFloat(value) * qty;
    total_price.val(qty);
}

function calculateMiscQty(qty) {
    var price = $("#misc_price").val();
    var total_price = $("#misc_total_price");
    var total = parseFloat(price) * qty;
    total_price.val(qty);
}

function calculateMiscDiscount(discount) {
    var total_price = $("#misc_total_price");
    var total = parseFloat(total_price.val()) - parseFloat(discount);
    total_price.val(total);
}

function calculateMiscDiscountInPercent(percent) {
    var total_price = $("#misc_total_price");
    var total = parseFloat(total_price.val()) - parseFloat(percent) / 100;
    total_price.val(total);
}
