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
      maxDate: '+1m',
      beforeShowDay: $.datepicker.noWeekends,
      onClose: function( selectedDate ) {
        $( "#from" ).datepicker( "option", "maxDate", selectedDate );
      }
    });
  });
})
