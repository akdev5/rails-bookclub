class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else
            flash[:message] = "Username or password not valid. Please try again."
            redirect_to '/login', alert: "Username or password not valid. Please try again."
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/login'
    end

    def omniauth
    end

private

    def auth
    end

end
