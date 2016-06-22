$(document).ready(function(e){
  $('.index_search_bar').click(function() {   
      $('.search_row').toggle(); 
    });
  
  $('.date_picker_reverse').datetimepicker({
      timepicker:false,
      format:'d-m-Y',
      formatDate:'Y-m-d'
  });
  
  $("input[id='is_checked']").change(function() {  
    if($('#is_checked').is(':checked')) { 
      $("#span_displaylist").show("highlight"); 
    }else{
      $("#span_displaylist").hide(""); 
    }
  });
  $("input[id='is_checked']").each(function() {  
    if($('#is_checked').is(':checked')) { 
      $("#span_displaylist").show("highlight"); 
    }else{
      $("#span_displaylist").hide(""); 
    }
  });
  
});
