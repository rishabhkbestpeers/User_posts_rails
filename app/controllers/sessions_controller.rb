class SessionsController < ApplicationController
    def new
        
    end
    def create
        user = User.find_by(email:params[:email])

        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to posts_path, notice: "logged in succesfully"
        else
            redirect_to sign_in_path, alert: "Invalid email or password"
        end
    end
    def destroy
        session.delete(:user_id)
        redirect_to root_path, notice: "Logged out"
    end
end