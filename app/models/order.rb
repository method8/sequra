class Order < ApplicationRecord

  # Model to hold records of the Orders

  validates :id, presence: true, numericality: { only_integer: true }
  validates :merchant_id, presence: true, numericality: { only_integer: true }
  validates :shopper_id, presence: true, numericality: { only_integer: true }
  validates :amount, presence: true, numericality: { only_integer: false }
  validates :created_at, presence: true, allow_blank: false
  validates :completed_at, presence: true, allow_blank: true
  validates :paid, presence: true, allow_blank: true

  scope :not_disbursed, -> { where('completed_at <> "" AND paid = "f"') }
end
