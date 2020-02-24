class Communication < ApplicationRecord
  belongs_to :building
  has_one_attached :release_doc
end
