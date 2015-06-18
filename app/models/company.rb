class Company < ActiveRecord::Base
  validates :name, presence: true
  has_many :phone_numbers, as: :contacts
end
