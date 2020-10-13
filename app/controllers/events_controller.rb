class EventsController < ApplicationController

def index
    if params[:id]
        @events = User.find_by(id: params[:id])
    elsif 
        params[:artist_id]
        @events = Artist.find_by(id: params[:artist_id])
    else 
        @events = Event.all
    end
    end


def new
  #  byebug
    @user = current_user if logged_in?
    user_ok?(@user)
        @event = @user.events.build
    end

    def create
        @user = current_user if logged_in?
        user_ok?(@user)
        @event = @user.events.build(event_params)
        if @event.save
            redirect_to event_show_path(@user.events.last)
        else 
            @errors = @event.errors
        end

      byebug
    end

    private

def event_params
    params.require(:event).permit(:name, :venue, :curtain, :user_id)
end


end
