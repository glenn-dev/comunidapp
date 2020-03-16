class GeneralExpense < ApplicationRecord
  belongs_to :concept
  belongs_to :building
end
