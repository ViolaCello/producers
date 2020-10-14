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
        if !!@user
        
       @artist_params = get_artists(params[:artist][:artist_ids])
       @artist_params.push(event_params)
     #  byebug
        @event = @user.events.build(@artist_params)
       byebug
        if @event.save
            redirect_to event_show_path(@event)
        else 
            @errors = @event.errors
            byebug
            render :'events/new'
        end
        redirect_to '/'
        end

      byebug
    end






    private

def event_params
    params.require(:event).permit(:name, :venue, :curtain, :user_id)
end

def get_artists(artist_ids)
    @artists = []
    artist_ids.each do |artist|
        full_artist = Artist.find_by(id: artist)
        @artists.push(full_artist.id) if !!full_artist
    end
    @artists
end


end
