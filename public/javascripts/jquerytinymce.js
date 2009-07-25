// tiny MCE -
//    jQuery plugin for accessible, unobtrusive WYSIWYG HTML editing
// v .1
// by Alton Crossley
// http://www.nogahidebootstrap.com/jtinymce/
// Free beer and free speech. Enjoy!
// The cool part is oh-so-simple
$.fn.tinymce = function(options)
{
    return this.each(function()
    {
        preString = "<div class='jqHTML_frame' style='width:"+$(this).css("width")+"px;height:" + ($(this).css("height")+20) + "px;'><div>";
        postString = "</div><div class='jqHTML_link' style='float:right' onclick="toogleEditorMode('" + this.id + "');">HTML</div></div>";
        $(this).wrap(preString + postString);
        //alert(this.id + '
' + $(this).html() + '
');
        //alert(this.id + '
Width:' + $(this).css("width") + '
Height:' + $(this).css("height"));
    });
}
// this is where we decide the toggle of 'on' (true) or 'off' (false)
// init an array to keep each id's state seperate
var tinyMCEmode = new Array();
// this is called by the click method
function toogleEditorMode(sEditorID)
{
    if(tinyMCEmode[sEditorID])
    {
        try
        {
            tinyMCE.removeMCEControl(tinyMCE.getEditorId(sEditorID));
            tinyMCEmode[sEditorID] = false;
        }
        catch(e)
        {
            alert( "REMOVE:" + sEditorID + ':
' + e.message);
        }
    }
    else
    {
        try
        {
            tinyMCE.addMCEControl(document.getElementById(sEditorID), sEditorID);
            tinyMCEmode[sEditorID] = true;
        }
        catch(e)
        {
            alert( "ADD:" + sEditorID + ':
' + e.message);
        }
    }
}
function removeAllMCE()
{
    for (var i in tinyMCEmode)
    {
        if(tinyMCEmode[i])
        {
            tinyMCE.removeMCEControl(tinyMCE.getEditorId(i));
            tinyMCEmode[i] = false;
        }
    }
    initMCE()
}
function initMCE()
{
    tinyMCE.init({ mode : "none",
       theme : "advanced",
       plugins : "advhr,advlink,style",
       theme_advanced_layout_manager : "SimpleLayout",
       theme_advanced_disable: "hr,",
       theme_advanced_buttons1: "pasteword,justifyleft,justifycenter,justifyright,justifyfull,separator,removeformat,separator,charmap,advhr,separator,styleprops",
       theme_advanced_buttons2: "styleselect,bold,italic,underline,separator,link,separator,bullist,numlist,outdent,indent,",
       theme_advanced_buttons3: "",
       theme_advanced_toolbar_location : "top",
       theme_advanced_toolbar_align : "left",
       content_css : "css/content.css"});
}
initMCE();
