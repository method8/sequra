class Shopper < ApplicationRecord

  # Model to hold records of the Shopper

  validates :id, presence: true, numericality: { only_integer: true }
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A(.+)@(.+)\z/i}
  validates :nif, presence: true, length: {is: 10}, allow_blank: false, format: { with: /\A([0-9]{9}[A-Z])\z/i}
end
