class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :film
    
    validates :content, presence: true
end
