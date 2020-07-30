class Book < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    has_many :comments
    has_many :users, through: :comments
    
    validates :title, :author, :genre, :description, presence: true
        
end