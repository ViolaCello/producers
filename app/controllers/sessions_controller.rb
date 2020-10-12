class SessionsController < ApplicationController

def index
end


def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
       sessions[:user_id] = @user.id
       redirect_to user_path
    else
       redirect_to '/login'
    end
 end

end