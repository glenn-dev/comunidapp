class Department < ApplicationRecord
  belongs_to :building
  has_many :users
  has_many :bills
end
