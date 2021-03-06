class ExpensesDetail < ApplicationRecord
  belongs_to :bill
  belongs_to :concept

  validates :amount, :concept_id, :building_id, presence: true
end
