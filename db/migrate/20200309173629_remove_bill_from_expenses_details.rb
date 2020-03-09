class RemoveBillFromExpensesDetails < ActiveRecord::Migration[5.2]
  def change
    remove_reference :expenses_details, :bill, foreign_key: true
  end
end
