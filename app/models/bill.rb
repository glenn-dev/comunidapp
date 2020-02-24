class Bill < ApplicationRecord
  belongs_to :expenses_detail
  belongs_to :department
end
