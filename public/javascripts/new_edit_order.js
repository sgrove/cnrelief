$(function() {
    $("#order_quoted_on").datepicker();
    $("#order_ordered_on").datepicker();
    $("#order_due_by").datepicker();

    //Tabs
    $("#tabs").tabs().addClass('ui-tabs-vertical ui-helper-clearfix').removeClass('ui-corner-all');
    $("#tabs li").removeClass('ui-corner-top').addClass('ui-corner-all');
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



    //Dialogues

    //CSR dialog defn
    $('#csr_dialog').dialog({
		title: "Select CSR for the order",
		draggable: false,
		modal: true,
		resizable: false,
		autoOpen: false,
		width: 600,
		buttons: {
			"Ok": function() {
				$(this).dialog("close");
			},
			"Cancel": function() {
				$(this).dialog("close");
			}
		}
	});

    //CSR dialog open link
	$('#csr_dialog_link').click(function(){
		$('#csr_dialog').dialog('open');
		return false;
	});

    //Estimator dialog defn
    $('#estimator_dialog').dialog({
        title: "Select estimator for the order",
        draggable: false,
        modal: true,
		resizable: false,
		autoOpen: false,
		width: 600,
		buttons: {
			"Ok": function() {
				$(this).dialog("close");
			},
			"Cancel": function() {
				$(this).dialog("close");
			}
		}
	});

    //Estimator dialog open link
	$('#estimator_dialog_link').click(function(){
		$('#estimator_dialog').dialog('open');
		return false;
	});

});

