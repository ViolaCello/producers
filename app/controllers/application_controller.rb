class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :user_ok? # :edit_ok?


    def current_user    
        @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
        !current_user.nil?  
    end

    

    #  def edit_ok?
    #     current_user.id == params[:id]
    #  end

     def user_ok?(user)
        if !!user == false || (user.id != current_user.id)
         redirect_to '/'
        else
            true
       end
     end

end
