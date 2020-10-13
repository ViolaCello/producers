module ApplicationHelper

    def current_user    
        @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
        !current_user.nil?  
    end

    def user_ok?(user)
        if user && user.id != current_user.id
         redirect_to '/'
       end
     end

end
