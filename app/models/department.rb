class Department < ApplicationRecord
  belongs_to :building
  has_many :users
  has_many :bills

  validates :num_dep, :floor, presence: true
  validates :num_dep, uniqueness: true
end
