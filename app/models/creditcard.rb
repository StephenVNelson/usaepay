class Creditcard < ApplicationRecord
  validates :number, presence: true, length: {in: 16..19}, numericality: true
  validates :expiration, presence: true, numericality: true
  validates :cvc, presence: true, length: {in: 3..4}, numericality: true
  validates :avs_street, presence: true
  validates :avs_zip, presence: true, numericality: true
  validates :cardholder, presence: true
end
