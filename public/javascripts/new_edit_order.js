$(function() {
    $("#order_quoted_on").datepicker();
    $("#order_ordered_on").datepicker();
    $("#order_due_by").datepicker();

    //auto-complete fields
    $("#order_csr_id").autocomplete("/employees");
    $("#order_estimator_id").autocomplete("/employees");

    //ups calculation
    $(".finish_flat_size").livequery('change', function(){
        var ffs = $(this).val();
        var rss = $(this).closest("#autocalc").find(".run_sheet_size").val();
        var calc_val = calcUps(ffs, rss);
        if(!isNaN(calc_val) && calc_val!=false)
        {
            $(this).closest("#autocalc").find(".ups_size").val(calc_val);
        }
    });

    $(".run_sheet_size").livequery('change', function(){
        var rss = $(this).val();
        var ffs = $(this).closest("#autocalc").find(".finish_flat_size").val();
        var calc_val = calcUps(ffs, rss);
        if(!isNaN(calc_val) && calc_val!=false)
        {
            $(this).closest("#autocalc").find(".ups_size").val(calc_val);
        }
    });

    //cost categpry select
    $(".costCatSelect").livequery('change', function()
                    {
                        var currentControl = $(this);
                        //work-around to take care not to return previous section values
                        var catval = $(this).closest('#costCatField').find('select').val();
                        var cost_set_id = $("#order_cost_set_id").val();
                        if(cost_set_id=="")
                        {
                            alert("Please select a cost set in the order details");
                        }
                        else
                        {
                            //url pattern /cost_sets/{cost_set_id}?category={category_id}
                            $.getJSON("/cost_sets/"+cost_set_id+".js?category="+catval, function(data, textStatus)
                            {
                                if(textStatus!="success")
                                {
                                    alert("ouch! the program sensed an error");
                                }
                                else
                                {
                                    var options=[];
                                    var target = currentControl.parent().next().children(":first");
                                    $(target).find('option').remove();

                                    size = data.length;
                                        for(key in data) {
                                            $(target).append($("<option></option>").attr("value",data[key].cost_id).text(data[key].name));
                                        }
                                }
                            });
                        }
                });

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

function calcUps(ffs, rss)
{

  if(rss=="" || ffs=="")
    return false;

  var fs = ffs.replace(/\s/g, "").split('x');
  var rs = rss.replace(/\s/g, "").split('x');
  //console.log(fs.length);
  //console.log(rs.length);

  if(fs.length == 2 ||  rs.length == 2)
  {
      if(rs[0] < rs[1])
      {
        x1 = rs[0];
        y1 = rs[1];
      }
      else
      {
        x1 = rs[1];
        y1 = rs[0];
      }

      if(fs[0] < fs[1])
      {
        x2 = fs[0];
        y2 = fs[1];
      }
      else
      {
        x2 = fs[1];
        y2 = fs[0];
      }
      return ( ( Math.floor(x1/x2) ) * ( Math.floor(y1/y2) ) );
  }
  else
  {
    //console.log("ya its less than 2");
    return false;
  }
}

