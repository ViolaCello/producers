class SessionsController < ApplicationController

def index
end


def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to user_path(@user)
    else
       redirect_to '/login'
    end
 end

def destroy
   session.clear
   redirect_to '/'
   @current_user = nil
end



def github
   # pp request.env['omniauth.auth']
   #  session[:name] = request.env['omniauth.auth']['info']['name']
   #  session[:omniauth_data] = request.env['omniauth.auth']
   # byebug
    #redirect_to home_path
    oauth_email = request.env['omniauth.auth']['info']['email']
    if @user = User.find_by(:email => oauth_email)
      session[:user_id] = @user.id 
    else 
      oauth_name = request.env['omniauth.auth']['info']['name']
      @user = User.new(:email => oauth_email, :name => oauth_name, :password => SecureRandom.hex)
      if @user.save
         session[:user_id] = @user.id
      else 
         #raise user.errors.full_messages.inspect
         @errors = @user.errors.full_messages
      end
    end
end





end