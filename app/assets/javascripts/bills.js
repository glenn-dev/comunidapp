$(document).on('ready turbolinks:load ajax:complete', function(){
	$('#add-expense').click(function(e){
		e.preventDefault()
		var addExpense = $(this).data('expense')
		$('.expenses_detail_td').append(addExpense)
	});
});