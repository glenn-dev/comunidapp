class UserType < ApplicationRecord
    has_many :users, dependent: :destroy

    validates :name, presence: true
    validates :name, uniqueness: true
end
