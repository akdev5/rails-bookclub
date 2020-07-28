class User < ApplicationRecord
    has_secure_password
    
    has_many :books
    has_many :received_comments, through: :books, source: :comments 
    has_many :comments
    has_many :commented_books, through: :comments, source: :books

    validates :username, :email, presence: true
    validates :email, uniqueness: true
    
end
