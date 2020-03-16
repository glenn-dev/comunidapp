class CreateGeneralExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :general_expenses do |t|
      t.float :amount
      t.boolean :status
      t.references :concept, foreign_key: true
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
