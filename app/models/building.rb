class Building < ApplicationRecord
    has_many :communications
    has_many :departments
    has_one_attached :logo

    validates :name, :address, presence: true
    validates :name, :address, uniqueness: true
end
