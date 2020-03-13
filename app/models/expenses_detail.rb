class ExpensesDetail < ApplicationRecord
  belongs_to :concept
  belongs_to :bill

  validates :amount, :concept_id, :bill_id, presence: true
end
