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


    //Add quantity dialog defn
    $('#add_quantity_dialog').dialog({
        title: "New Quantity",
        draggable: false,
        modal: true,
		resizable: false,
		autoOpen: false,
		width: 400,
		buttons: {
			"Ok": function() {
                var now_num = parseInt(($("#quantity_set").val()));
                var qty_amt_val = $("#temp_qty_amount").val();
                var qty_markup_val = $("#temp_qty_markup").val();
                var qty_note_val = $("#temp_qty_note").val();

                if($("#qty_status").html()!="")
                {
                    alert("we here");
                    var qty_id = $("#qty_status").html();
                    alert(qty_id);
                    alert($("#quantity_list_"+qty_id+"_amount").val() );
                    $("#quantity_list_"+qty_id+"_amount").val(qty_amt_val);
                    $("#quantity_list_"+qty_id+"_markup").val(qty_markup_val);
                    $("#quantity_list_"+qty_id+"_note").val(qty_note_val);

                    var disp_qty = '<div class="span-2" id="fieldh">'
                                       + '<a title="class="ui-state-default ui-corner-all" onclick="edit_qty('+now_num+')">'
                                       + '<img src="/images/edit.png" alt="edit"/></a>'
                                       + '&nbsp;&nbsp;<a title="class="ui-state-default ui-corner-all" onclick="delete_qty('+now_num+')">'
                                       + '<img src="/images/delete.png" alt="delete"/></a>'
                                       + '</div>'
                                       + '<div class="span-3" id="fieldh">'+qty_amt_val+'</div>'
                                       + '<div class="span-3" id="fieldh">'+qty_markup_val+'</div>'
                                       + '<div class="span-10 last" id="fieldh">'+qty_note_val+'</div>';

                    $("#quantity_fields_"+qty_id+"").html(disp_qty);
                    $("#qty_status").html("");
                }
                else
                {
                    var qty_htmlstring = '<div id="quantity_list_'+now_num+'">'
                                          + '<input type="hidden" id="quantity_list_'+now_num+'_amount" name="order[quantities][][amount]" value="'+qty_amt_val+'"/>'
                                          + '<input type="hidden" id="quantity_list_'+now_num+'_markup" name="order[quantities][][markup]" value="'+qty_markup_val+'"/>'
                                          + '<input type="hidden" id="quantity_list_'+now_num+'_note" name="order[quantities][][note]" value="'+qty_note_val+'"/>'
                                          + '</div>';

                    var disp_qty = '<div class="span-18 last" id="quantity_fields_'+now_num+'">'
                                       + '<div class="span-2" id="fieldh-c">'
                                       + '<a class="ui-buttons" onclick="edit_qty('+now_num+')">'
                                       + '<img src="/images/edit.png" alt="edit"/></a>'
                                       + '&nbsp;&nbsp;<a class="ui-buttons" onclick="delete_qty('+now_num+')">'
                                       + '<img src="/images/delete.png" alt="delete"/></a>'
                                       + '</div>'
                                       + '<div class="span-3" id="fieldh">'+qty_amt_val+'</div>'
                                       + '<div class="span-3" id="fieldh">'+qty_markup_val+'</div>'
                                       + '<div class="span-10 last" id="fieldh">'+qty_note_val+'</div>'
                                       +'</div>';

                    if(now_num=="0" || ($("#quantity_list").children().length==0))
                    {
                        $('#quantity_list').html(qty_htmlstring);
                        $('#quantity_fields').html(disp_qty);
                    }
                    else
                    {
                        var tmp_holder = $('#quantity_list').html() + qty_htmlstring;
                        $('#quantity_list').html(tmp_holder);
                        tmp_holder = $('#quantity_fields').html() + disp_qty;
                        $('#quantity_fields').html(tmp_holder);
                    }

                    $("#quantity_set").val((now_num+1));
                }

                $("#temp_qty_amount").val("");
                $("#temp_qty_markup").val("");
                $("#temp_qty_note").val("");

				$(this).dialog("close");
			},
			"Cancel": function() {
				$("#temp_qty_amount").val("");
                $("#temp_qty_markup").val("");
                $("#temp_qty_note").val("");
                $("#qty_status").html("");
				$(this).dialog("close");
			}
		}
	});




    //Add quantity dialog open link
	$('#add_quantity_dialog_link').click(function(){
        $('#add_quantity_dialog').dialog('open');
		return false;
	});


    //blank validations
    if($("#quantity_list").html()=="")
    {
        var quantity_msg = '<br/><p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span><strong>No quantities added yet</strong></p>';
        $("#quantity_fields").html(quantity_msg);
    }


});

    //edit quantity dialog link
	function edit_qty(qty_id)
	{
        $("#qty_status").html(qty_id);
        $("#temp_qty_amount").val($('#quantity_list_'+qty_id+'_amount').val());
        $("#temp_qty_markup").val($('#quantity_list_'+qty_id+'_markup').val());
        $("#temp_qty_note").val($('#quantity_list_'+qty_id+'_note').val());
        $('#add_quantity_dialog').data('title.dialog', 'Edit Quantity');
        $('#add_quantity_dialog').dialog('open');
	}

	function delete_qty(qty_id)
	{
        $("#quantity_list_"+qty_id).remove();
        $("#quantity_fields_"+qty_id).remove();
        var qty_set_val = $("#quantity_set").val()-1;
        alert(qty_set_val);
        $("#quantity_set").val(qty_set_val);

        if(qty_set_val==0 || qty_set_val=="0")
        {
            var quantity_msg = '<br/><p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span><strong>No quantities added yet</strong></p>';
            $("#quantity_fields").html(quantity_msg);
        }
	}

