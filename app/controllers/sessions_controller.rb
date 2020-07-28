class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else
            redirect_to '/signin', alert: "Username or password not valid. Please try again."
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/signin'
    end

    def omniauth
    end

private

    def auth
    end

end
