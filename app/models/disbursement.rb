class Disbursement < ApplicationRecord

  # Model to hold records of disbursements

  validates :order_id, presence: true, numericality: { only_integer: true }
  validates :merchant_id, presence: true, numericality: { only_integer: true }
  validates :fee, presence: true, numericality: { only_integer: false }
  validates :disbursed_amount, presence: true, numericality: { only_integer: false }
  validates :created_at, presence: true, allow_blank: false

end
