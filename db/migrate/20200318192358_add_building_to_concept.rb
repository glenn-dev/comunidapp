class AddBuildingToConcept < ActiveRecord::Migration[5.2]
  def change
    add_reference :concepts, :building, foreign_key: true
  end
end
