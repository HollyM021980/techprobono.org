var isDescendant = function (parent, child) {
    var node = child;
    while (node != null) {
        if (node == parent) {
            return true;
        }
        node = node.parentNode;
    }
    return false;
};

$(document).ready(function() {

    var documentHeight = $(document).height();
    // $('window').unbind("click");

    $("#charity_category").change(function(e) {
        var head = $('#updateHeadline')[0];
        var selectedValue = e.currentTarget[e.currentTarget.selectedIndex].getAttribute("data-short-form") || e.currentTarget.value;
        head.style.fontStyle = "normal";
        head.innerHTML = selectedValue;
    });

});
