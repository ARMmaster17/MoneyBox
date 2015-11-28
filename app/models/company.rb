class Company < ActiveRecord::Base
    validates :name, presence: true, length: { minimum: 3, maximum: 15 }
    validates :value, presence: true
    validates :stock, presence: true
end
