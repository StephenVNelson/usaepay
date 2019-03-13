class Epay < ApplicationRecord
  include HTTParty

  validates :amount, presence: true

  has_one :creditcard
  accepts_nested_attributes_for :creditcard
end
