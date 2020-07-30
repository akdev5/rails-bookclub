class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to books_path
        else
            redirect_to '/signin', alert: "Username or password not valid. Please try again."
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def omniauth
        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to books_path
        else
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to signin_path
        end
    end

private

    def auth
        request.env['omniauth.auth']
    end

end
