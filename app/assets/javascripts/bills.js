$(document).on('ready turbolinks:load', function(){
	$('#add-expense').click(function(e){
		e.preventDefault()
		var new_expense = $(this).data('expense')
		$('ul').append(new_expense)
	})
})