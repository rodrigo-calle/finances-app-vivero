class Category < ApplicationRecord
    has_many :finances
    validates :name, presence: true 
    validates :name, uniqueness: true
end
