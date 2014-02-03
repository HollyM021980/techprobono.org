
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

    var closeModals = function(){
        $(".modal").addClass("hidden");
    };

    var openModal = function(modal) {
        closeModals();
        $('#' + modal).removeClass("hidden");
        window.addEventListener("click", (function windowClickDetector(e) {
            console.log(e.target);
            debugger;
            if(e.target === $('#' + modal).get() || isDescendant($('#' + modal).get(), e.target)) {
                return
            } else {
                if(!modal){
                    closeModals();
                    window.removeEventListener("click", windowClickDetector, false);
                }
            }
        }), false)
    };

    $("#signupwithemail").slideUp();

    $("#emailsignup").click(function(){
        $('#emailsignup').slideUp();
        $("#signupwithemail").slideDown();
    });

    $("#external_details .addmore").click(function() {
        openModal("addContact");
    });

    $("#updateIntro").click(function() {
        openModal("addDescription");
    });

    $("#updateHeadline").click(function() {
        openModal("addHeadline");
    });

    openModal("completeSignup");

    $('#external_details .addmore').click(function(e){
        e.preventDefault();
        createTechListItem(e);
    });

});

	var windowClick = function(e) {
        var el = e.target;
        e.preventDefault();
        if(!core.isDescendant($("calendar"), el)) {
            if(isOpen) {
                hideCalendar();
            }
        }
    };

	var hideCalendar = function() {
        core.hide($("calendar"));
        window.removeEventListener("click", windowClick, false);
        isOpen = false;
    };

	var showCalendar = function() {
	    core.show($("calendar"));
	    window.addEventListener("click", windowClick, false);
	    isOpen = true;
	};
