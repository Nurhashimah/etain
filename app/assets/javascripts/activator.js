$(document).ready(function(e){
  $('.index_search_bar').click(function() {   
      $('.search_row').toggle(); 
    });
  
  $('.date_picker_reverse').datetimepicker({
      timepicker:false,
      format:'d-m-Y',
      formatDate:'Y-m-d'
  });
});
