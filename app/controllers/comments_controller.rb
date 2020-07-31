class CommentsController < ApplicationController
    before_action :find_comment, :redirect_if_not_user, only: [:show, :edit, :update, :destroy]
    
    def index
        if params[:bookss_id]
          @comments = Book.find(params[:book_id]).comments
        else
          @comments = Comment.all
        end
    end

    def new
        @comment = Comment.new(book_id: params[:book_id])
        @book = Book.find(params[:id])
    end

    def create
        @book = Book.find(params[:id])
        @comment = @book.comments.create(comment_params)
        @comment.user.id = current_user.id
        if @comment.save
            redirect_to book_path(@book)
        else
            redirect_to book_path(@book)
        end
    end

    def show
        find_comment
      end

    def edit
    end

    def update
    end

    def destroy
    end

private

    def find_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
    end

end
