class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :is_authenticate?
    
    
    def set_current_user
      if session[:user_id]
        Current.user = User.find_by(id: session[:user_id])
      end
    end
  
    def is_authenticate?
      return if ["registrations","sessions"].include?(params[:controller]) && ["new","create"].include?(params[:action])
      
      if session[:user_id].nil?
         redirect_to sign_in_path, notice:"please login !"
      end
    end
  
end
