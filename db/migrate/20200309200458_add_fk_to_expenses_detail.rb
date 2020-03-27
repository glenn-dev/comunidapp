class AddFkToExpensesDetail < ActiveRecord::Migration[5.2]
  def change
    add_reference :expenses_details, :bill, foreign_key: true
  end
end
