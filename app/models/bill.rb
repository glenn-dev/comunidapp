class Bill < ApplicationRecord
  belongs_to :department
  has_many :expenses_details
  has_one_attached :bill_doc
  has_one_attached :voucher_doc

  validates :num_bill, :department_id, presence: true
  validates :num_bill, uniqueness: true
end
