class CreateExpensesDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses_details do |t|
      t.float :amount
      t.references :concept, foreign_key: true

      t.timestamps
    end
  end
end
