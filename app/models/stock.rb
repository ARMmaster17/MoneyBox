class Stock < ActiveRecord::Base
  validates :ticker_name, presence: true, length: { minimum: 3, maximum: 10 }
  validates :value, presence: true
  validates :quantity, presence: true
end
