class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :num_bill
      t.float :total
      t.date :issue_date
      t.boolean :status
      t.string :bill_doc
      t.string :paid_doc
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
