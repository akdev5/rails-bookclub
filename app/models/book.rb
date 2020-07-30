class Book < ApplicationRecord
    belongs_to :user
    has_many :genres
    has_many :comments
    has_many :users, through: :comments
    
    
        
end