class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :num_dep
      t.string :floor
      t.boolean :defaulting
      t.boolean :habitability
      t.float :collection
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
