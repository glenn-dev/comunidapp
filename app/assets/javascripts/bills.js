$(document).on('ready turbolinks:load', function(){
	$('#add-expense').click(function(e){
		e.preventDefault()
		var addExpense = $(this).data('expense')
		$('td').append(addExpense)
	})
})