class ExpensesDetail < ApplicationRecord
  belongs_to :bill
  belongs_to :concept
end
