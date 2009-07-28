$(function() {

    //Dates
    $("#order_quoted_on").datepicker();
    $("#order_ordered_on").datepicker();
    $("#order_due_by").datepicker();


    //Tabs
    $("#tabs").tabs().addClass('ui-tabs-vertical ui-helper-clearfix').removeClass('ui-corner-all');
    $("#tabs li").removeClass('ui-corner-top').addClass('ui-corner-all');
    $("#tabs ul").removeClass('ui-widget-header');


    //Dialogues

    //CSR dialog defn
    $('#csr_dialog').dialog({
		title: "Select CSR for the order",
		draggable: false,
		modal: true,
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

