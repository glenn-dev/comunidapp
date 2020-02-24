class Bill < ApplicationRecord
  belongs_to :department
  has_many :expenses_details
end
