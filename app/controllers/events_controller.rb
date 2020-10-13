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

end
