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
    var okToCloseModals = true;

    // $('window').unbind("click");

    var closeModals = function() {
        $(".modal").addClass("hidden");
    };

    var openModal = function(modal) {
        if(!okToCloseModals) {
            return false;
        }
        closeModals();
        $('#' + modal).removeClass("hidden");
        window.addEventListener("click", function windowClickDetector(e) {
            if(e.target.className.indexOf("modaltrigger") != -1 || e.target === $('#' + modal).get()[0] || isDescendant($('#' + modal).get()[0], e.target)) {
                return
            } else {
                window.removeEventListener("click", windowClickDetector, false);
                $('#' + modal).addClass("hidden");

            }
        }, false);
    };

    $("#loginout").click(function() {
        openModal("loginModal");
    });

    $("#login_cancel_logout").click(function() {
        closeModals();
    });

    $("submitPassword").click(function(e) {
        e.preventDefault();
        okToCloseModals = true;
        return false;
    })

    $("#submitContacts").click(function() {
        var inputs = document.querySelectorAll("#addContact input"),
            params = {
                contacts: []
            },
            i, li;
        for(i = 0; i < inputs.length; i++) {
            if(inputs[i].value) {
                params.contacts.push({
                   contact_type:  inputs[i].id,
                   value: inputs[i].value
                })
            }
        }

        $.ajax({
            type: "POST",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            url: "/technologists/update",
            data: params,
            dataType: "text/json",
            success: function(data) {
                $('#external_details').empty();
                for (var i = 0; i < data.contacts.length; i++) {
                        li = document.createElement("LI");
                        li.className = data.contacts[i].contact_type;
                        li.innerHTML = data.contacts[i].value;
                        $('#external_details').append(li);
                }
                var addmore = document.createElement("LI");
                addmore.className = "addmore";
                addmore.innerHTML = "+ add contact";
                addmore.addEventListener("click", function() {
                    openModal("addContact");
                }, false);
                $('#external_details').append(addmore);
                closeModals();
            },
            error: function() {
                // do something here. Would be nice.
            }
        });

    });

    $("#emailsignup").click(function() {
        $("#signupwithemail").slideDown();
    });

    $("#external_details .addmore").click(function() {
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

    $('#headline').keyup(function(e) {
        var node = e.target,
            params;
        if (e.keyCode === 13 || e.keyCode === 10) {
            params = node.className + "+" + node.innerHTML;
            var head = $('#updateHeadline')[0];
            head.style.fontStyle = "normal";
            head.innerHTML = node.value;
            closeModals();
            $.ajax({
                type: "POST",
                url: "/technologists/update",
                beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
                // FIXME: node.innerHTML is empty when you submit it to DB.
                data: { "professional_headline": node.value},
                success: function(json) {
                    var head = $('#updateHeadline')[0];
                    head.style.fontStyle = "normal";
                    head.innerHTML = node.value;
                    closeModals();
                },
                error: function() {
                    // do something here. Would be nice.
                }
            });
        }
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
