class Concept < ApplicationRecord
    has_many :expenses_details
    has_many :general_expenses

    validates :name, presence: true
    validates :name, uniqueness: true
end
