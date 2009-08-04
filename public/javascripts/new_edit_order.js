$(function() {
    $("#order_quoted_on").datepicker();
    $("#order_ordered_on").datepicker();
    $("#order_due_by").datepicker();

    //auto-complete fields
    $("#order_csr_id").autocomplete("/employees");
    $("#order_estimator_id").autocomplete("/employees");

    //Tabs
    $("#tabs").tabs().addClass('ui-tabs-vertical ui-helper-clearfix').removeClass('ui-corner-all');
    $("#tabs li").removeClass('ui-corner-top').removeClass('ui-corner-all');
    $("#tabs ul").removeClass('ui-widget-header');

    $("#newQty").click( function() {
        var new_id = new Date().getTime();
        $(this).after( quantity.replace(/NEW_RECORD/g, new_id) );
    });

    $("#newSec").click( function() {
        var new_id = new Date().getTime();
        $(this).after( section.replace(/NEW_RECORD/g, new_id) );
    });


    $(".newCostlink").livequery('click', function() {
        var new_id = new Date().getTime();
        the_parent_id = $(this).closest("#newSecSpace").attr('id');
        the_parent_id = "#"+the_parent_id;
        parent_object_id = $(the_parent_id).find("#referd").find('input').attr('name').match(/.*\[(\d+)\]/)[1];
        template = eval("cost");
        template = template.replace(/(attributes[_\]\[]+)\d+/g, "$1"+parent_object_id)
        template = template.replace(/NEW_RECORD/g, new_id);
        $(this).after(template);
    });

});

