$(document).ready(function(){
  $(function() {
    var dateToday = new Date();
    $( "#from" ).datepicker({
      defaultDate: "+1w",
      dateFormat: 'dd/mm/yy',
      changeMonth: true,
      numberOfMonths: 1,
      minDate: dateToday,
      beforeShowDay: $.datepicker.noWeekends,
      onClose: function( selectedDate ) {
        $( "#to" ).datepicker( "option", "minDate", selectedDate );
      },
    });
    $( "#to" ).datepicker({
      defaultDate: "+1w",
      dateFormat: 'dd/mm/yy',
      changeMonth: true,
      numberOfMonths: 1,
      beforeShowDay: $.datepicker.noWeekends,
      onClose: function( selectedDate ) {
        $( "#from" ).datepicker( "option", "maxDate", selectedDate );
      }
    });
  });
  $(function() {
    $( "#datepicker" ).datepicker({
      // dateFormat: 'dd/mm/yy'
    });
  });
  $("#flashmsg").click(function(){
    $("#flash").remove();
  });
  $(".presents").parent().css( "background-color", "#D8F6CE" );
  $(".absents").parent().css( "background-color", "#F6CECE" );
  $(".future .absents").html("");
  $(".prev-month .absents").html("")
})
