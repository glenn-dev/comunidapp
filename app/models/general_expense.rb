class GeneralExpense < ApplicationRecord
  belongs_to :concept
  belongs_to :building

  validates :amount, :concept_id, :building_id, presence: true
end
