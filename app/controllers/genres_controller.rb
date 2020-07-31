class GenresController < ApplicationController
    
    def index
        @genres = Genre.alphabetize
    end
    
    def show
        @genre = Genre.find(params[:id])
    end
    
end