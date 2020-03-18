class Building < ApplicationRecord
    has_many :communications, dependent: :destroy
    has_many :departments, dependent: :destroy
    has_many :bills, dependent: :destroy
    has_many :general_expenses, dependent: :destroy
    has_many :users, dependent: :destroy

    has_one_attached :logo

    validates :name, :address, presence: true
    validates :name, :address, uniqueness: true

end
