module SessionsHelper
   def current_user
    @current_user ||= User.find_by(id: session[:user_id])
   end
    
   def logged_in?
      !current_user.nil? 
   end 
    
   def request_login
      if current_user.nil?
        redirect_to new_session_path, notice: "ログインが必要です"
      end
   end  
end
