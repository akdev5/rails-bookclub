module BooksHelper

    def genre_has_books?
        if @genre.books = nil
            "There are no books listed for this genre yet!"
        end
    end
    
end
