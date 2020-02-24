class Bill < ApplicationRecord
  belongs_to :department
  has_many :expenses_details
  has_one_attached :bill_doc
  has_one_attached :voucher_doc
end
