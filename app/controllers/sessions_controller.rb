class SessionsController < ApplicationController

def index
end


def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to user_path(@user)
    else
      @error = "Login Failed"
      render :new
    end
 end

def destroy
   session.clear
   @current_user = nil
   redirect_to '/'
end



def github
    oauth_email = request.env['omniauth.auth']['info']['email']
    if @user = User.find_by(:email => oauth_email)
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else 
      oauth_name = request.env['omniauth.auth']['info']['name']
      oauth_co = request.env['omniauth.auth']['extra']['raw_info']['company']
      @user = User.new(:email => oauth_email, :name => oauth_name, :company => oauth_co, :password => SecureRandom.hex)
    
      if @user.save
         session[:user_id] = @user.id
         redirect_to user_path(@user)
      else 
         @errors = @user.errors.full_messages
         render :github
      end
    end
end

end