
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

    var closeModals = function() {
        $(".modal").addClass("hidden");
    };

    var openModal = function(modal) {
        closeModals();
        $('#' + modal).removeClass("hidden");
        window.addEventListener("click", function windowClickDetector(e) {
            if(e.target.className.indexOf("addmore") != -1 || e.target === $('#' + modal).get()[0] || isDescendant($('#' + modal).get()[0], e.target)) {
                return
            } else {
                window.removeEventListener("click", windowClickDetector, false);
                $('#' + modal).addClass("hidden");

            }
        }, false);
    };

    $("#addContact span").focus(function(e) {
        var node = e.target;
        if(node.innerHTML.indexOf("add contact") != -1){
            node.innerHTML = "";
        }
    });


    $("#addContact span").keyup(function(e) {
        var node = e.target,
            params;
        node.style.fontStyle = "normal";
        if (e.keyCode === 13 || e.keyCode === 10) {
            params = node.className + "+" + node.innerHTML;
            $.ajax({
                type: "POST",
                url: "developer/network",
                data: params,
                success: function(json) {
                    core.flash(node);
                },
                error: function() {
                    node.innerHTML = "+ add contact";
                    node.style.fontStyle = "italic";
                }
            });
        }
    });

    $("#signupwithemail").slideUp();

    $("#emailsignup").click(function() {
        $('#emailsignup').slideUp();
        $("#signupwithemail").slideDown();
    });

    $("#external_details .addmore").click(function() {
        console.log("add details")
        openModal("addContact");
    });

    $("#updateIntro").click(function() {
        openModal("addDescription");
    });

    var addtechnologies = function() {
        $("#techlist li").each(function() {
            this.classList.toggle("editable");
        });
    }

    $("#techlist .addmore").click(function() {
        addtechnologies();
    });

    $("#updateHeadline").click(function() {
        openModal("addHeadline");
    });

   // openModal("completeSignup");

    $('#external_details .addmore').click(function(e) {
        e.preventDefault();
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
