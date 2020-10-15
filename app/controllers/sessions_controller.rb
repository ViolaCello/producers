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
    # After entering a name and email value in the /auth/developer
    # path and submitting the form, you will see a pretty-print of
    # the authentication data object that comes from the "developer"
    # strategy. In production, we'll swap this strategy for something
    # like 'github' or 'facebook' or some other authentication broker
    pp request.env['omniauth.auth']

    # We're going to save the authentication information in the session
    # for demonstration purposes. We want to keep this data somewhere so that,
    # after redirect, we have access to the returned data
    session[:name] = request.env['omniauth.auth']['info']['name']
    session[:omniauth_data] = request.env['omniauth.auth']

    byebug
    # Ye olde redirect
    redirect_to home_path
 end

end