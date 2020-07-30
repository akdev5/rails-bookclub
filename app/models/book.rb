class Book < ApplicationRecord
    belongs_to :user
    has_many :books_genres
    has_many :genres, through: :books_genres
    has_many :comments
    has_many :users, through: :comments
    
    validates :title, :author, :description, presence: true
        
end