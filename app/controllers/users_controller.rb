class UsersController < ApplicationController

def index
    @users = User.all
   # byebug
end

def new
    @user = User.new
end

def create
    @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
end
    
def show
  # byebug
    @user = User.find_by(id: params[:id])
    # byebug
    redirect_to '/' if @user == nil
end

def edit
    if logged_in?
        @user = User.find_by(id: params[:id])
       user_ok?(@user) 
    else
        redirect_to '/login'
    end 
end 



private

def user_params
    params.require(:user).permit(:name, :password, :company, :email)
end


end