class Bill < ApplicationRecord
  belongs_to :department
  has_many :expenses_details, dependent: :destroy
  has_one_attached :bill_doc
  has_one_attached :voucher_doc

  accepts_nested_attributes_for :expenses_details, allow_destroy: true, 
  reject_if: -> (attributes) { attributes['amount'].blank? }

  validates :num_bill, :department_id, presence: true
  validates :num_bill, uniqueness: true
end
