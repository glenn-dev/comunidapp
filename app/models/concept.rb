class Concept < ApplicationRecord
    has_many :expenses_details
    has_many :general_expenses

    validates :name, :building_id, presence: true
    validates :name, uniqueness: true
end
