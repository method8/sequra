class Merchant < ApplicationRecord

  # Model to hold records of the Merchant

  validates :id, presence: true, numericality: { only_integer: true }
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,  format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :cif, presence: true, length: {is: 10},allow_blank: false, format: { with: /\A([A-Z][0-9]{9})\z/i}
end
