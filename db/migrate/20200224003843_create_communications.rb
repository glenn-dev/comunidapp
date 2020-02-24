class CreateCommunications < ActiveRecord::Migration[5.2]
  def change
    create_table :communications do |t|
      t.integer :num_release
      t.string :title
      t.string :content
      t.boolean :status
      t.string :document
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
