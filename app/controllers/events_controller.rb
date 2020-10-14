class EventsController < ApplicationController

def index
    if params[:user_id]
        @user = User.find_by(id: params[:user_id])
        @events = @user.events
    elsif 
        params[:venue_id]
        @artist = Artist.find_by(id: params[:artist_id])
        @events = @artist.events
    else 
        @events = Event.all
    end
    end


def new
   @user = current_user if logged_in?
    if !!@user
    @venues = Venue.all
        @event = @user.events.build
    else 
        redirect_to '/'
    end
end

    def create
        @user = current_user if logged_in?
        if !!@user
        @event = @user.events.build(event_params)
     
        if @event.save
            redirect_to event_path(@event)
        else 
            @errors = @event.errors
            render :'events/new'
        end
        end
    end


    def show
        @event = Event.find_by(id: params[:id])
    end




    private

def event_params
    params.require(:event).permit(:name, :venue_id, :curtain, :user_id)
end




end
