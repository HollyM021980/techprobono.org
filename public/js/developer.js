$(document).ready(function() {

    var documentHeight = $(document).height();

    $("#signupwithemail").slideUp();


    $('window').unbind("click");

    $("#emailsignup").click(function(){
        $('#emailsignup').slideUp();
        $("#signupwithemail").slideDown();
    });

    var openModal = function(modal) {
        $('window').click(function(modal){
            // do open stuff
        })
    };

    $('#external_details .addmore').click(function(e){
        e.preventDefault();
        createTechListItem(e);
    });

});


	var windowClick = function(e) {
        var el = e.target;
        e.preventDefault();
        if(el != triggerElement && !core.isDescendant($("calendar"), el)) {
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
