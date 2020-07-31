class CommentsController < ApplicationController
    before_action :find_comment, :redirect_if_not_user, only: [:show, :edit, :update, :destroy]
    
    def index
        if params[:books_id]
          @comments = Book.find(params[:book_id]).comments
        else
          @comments = Comment.all
        end
    end

    def new
        @comment = Comment.new(book_id: params[:book_id])
    end

    def create
        @book = Book.find(params[:book_id])
        @comment = @book.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to book_path(@book)
        else
            redirect_to books_path
        end
    end

    def show
        find_comment
      end

    def edit
    end

    def update
        @book = Book.find(params[:book_id])
        if @comment.update(comment_params)
            redirect_to book_path(@book)
        else
            render :edit
        end
    end

    def destroy
    end

private

    def find_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:content, :book_id, user_attributes: [:name])
    end

end
