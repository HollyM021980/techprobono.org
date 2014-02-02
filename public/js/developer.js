$(document).ready(function() {

    var documentHeight = $(document).height();

    $('window').unbind("click");


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
