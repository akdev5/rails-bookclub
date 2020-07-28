class User < ApplicationRecord
    has_secure_password
    has_many :books
    has_many :received_comments, through: :books, source: :comments 
        validates :username, :email, presence: true
        validates :email, uniqueness: true
        validates :password, confirmation: true
        validates :password_confirmation, presence: true
    has_many :comments
    has_many :received_comments, through: :comments, source: :films

end
