class Communication < ApplicationRecord
  belongs_to :building
  has_one_attached :release_doc

  validates :num_release, :title, :content, presence: true
  validates :num_release, uniqueness: true
end
