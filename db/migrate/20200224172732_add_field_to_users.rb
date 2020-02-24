class AddFieldToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :user_types, foreign_key: true
  end
end
