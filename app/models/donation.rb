class Donation < ActiveRecord::Base
  validates :phone_number, :presence => true
  validates :amount, :presence => true
end
