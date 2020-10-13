class EventsController < ApplicationController

def index
    if params[:user_id]
        @user = User.find_by(id: params[:user_id])
        @events = @user.events
    elsif 
        params[:artist_id]
        @artist = Artist.find_by(id: params[:artist_id])
        @events = @artist.events
    else 
        @events = Event.all
    end
    end


def new
   @user = current_user if logged_in?
    if !!@user
    @artists = Artist.all
        @event = @user.events.build
    else 
        redirect_to '/'
    end
end

    def create
        @user = current_user if logged_in?
        user_ok?(@user)
        byebug
        @event = @user.events.build(event_params)
        if @event.save
            redirect_to event_show_path(@event)
        else 
            @errors = @event.errors
            render :'events/new'
        end

      byebug
    end






    private

def event_params
    params.require(:event).permit(:name, :venue, :curtain, :user_id)
end


end
