class ExpensesDetail < ApplicationRecord
  belongs_to :concept
  belongs_to :bill
end
