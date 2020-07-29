class User < ApplicationRecord
    has_secure_password

    has_many :books
    has_many :received_comments, through: :books, source: :comments 
    has_many :comments
    has_many :commented_books, through: :comments, source: :books

    validates :name, :email, presence: true
    validates :email, uniqueness: true

    def self.create_from_omniauth(auth)
        self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.name = auth['info']['first_name']
            u.email = auth['info']['email'] 
            u.password = SecureRandom.hex(16)
        end
    end
    
end
