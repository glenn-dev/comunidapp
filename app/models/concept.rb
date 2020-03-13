class Concept < ApplicationRecord
    has_many :expenses_details

    validates :name, presence: true
    validates :name, uniqueness: true
end
