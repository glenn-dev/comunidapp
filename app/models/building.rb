class Building < ApplicationRecord
    has_many :communications
    has_many :departments
end
