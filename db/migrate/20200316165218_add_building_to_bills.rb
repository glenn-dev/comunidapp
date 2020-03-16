class AddBuildingToBills < ActiveRecord::Migration[5.2]
  def change
    add_reference :bills, :building, foreign_key: true
  end
end
