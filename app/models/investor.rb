class Investor < ActiveRecord::Base
    has_many :stocks
    validates :user_name, presence: true, length: { minimum: 3, maximum: 15 }
    validates :password, presence: true, length: {minimum: 5, maximum: 15 }
end
