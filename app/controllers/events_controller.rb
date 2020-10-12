class EventsController < ApplicationController

def index
    if params[:user_id]
        @events = User.find_by(id: params[:user_id])
    elsif 
        params[:artist_id]
        @events = Artist.find_by(id: params[:artist_id])
    else 
        @events = Event.all
    end
    end

end
