$(document).on('ready turbolinks:load ajax:complete', function(){
	$('#add-expense').click(function(e){
		e.preventDefault()
		var addExpense = $($(this).data('expense'))
		addExpense.find("input, select, textarea").each(function() {
			$(this).attr("name", function() {
				return $(this)
					.attr("name")
					.replace("new_record", new Date().getTime());
			});
		});
		$('.expenses_detail_td').append(addExpense)
	});
});