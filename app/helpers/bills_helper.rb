module BillsHelper
    def add_expenses_detail_button(form)
		expenses_fields = form.fields_for(:expenses_detail, ExpensesDetail.new) do |expenses_form|
			render 'expenses/expenses_fields', expenses_form: expenses_form
		end
    html_options = {
      css: "far fa-plus-square fa-2x btn",
      href: '#',
      id: 'add-expense',
      data: { expense: expenses_fields }
    }
    content_tag(:i, '+', html_options)
  end
end
