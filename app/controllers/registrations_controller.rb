class RegistrationsController < ApplicationController

    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to posts_path, notice: "Successfully created account"
        else
            flash[:alert] = "invalid email"
            redirect_to sign_up_path
        end
        # User.new({email:"botb@bob",password:"password"})
    end
    

    private
    
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end