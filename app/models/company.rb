class Company < ActiveRecord::Base
  validates :name, presence: true
  has_many :email_addresses
  has_many :phone_numbers
end
