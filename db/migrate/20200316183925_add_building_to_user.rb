class AddBuildingToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :building, foreign_key: true
  end
end
