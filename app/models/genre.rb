class Genre < ApplicationRecord
    has_many :books_genres
    has_many :books, through: :books_genres
    
    validates :name, presence:true

    def self.alphabetize
        self.order(:name)
    end

end