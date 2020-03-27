class AddFieldToExpensesDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses_details, :expenses_type, :boolean
  end
end
