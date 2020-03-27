class AddBuildingToExpensesDetail < ActiveRecord::Migration[5.2]
  def change
    add_reference :expenses_details, :building, foreign_key: true
  end
end
