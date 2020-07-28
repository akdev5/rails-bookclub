class CommentsController < ApplicationController
    before_action :find_comment, :redirect_if_not_user, only: [:show, :edit, :update, :destroy]
    
    def new
    end

    def create
    end

    def show
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
