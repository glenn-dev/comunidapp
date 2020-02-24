class AddUserTypesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :user_type, foreign_key: true
  end
end
