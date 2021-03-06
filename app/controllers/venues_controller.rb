class VenuesController < ApplicationController

def index
    @venues = Venue.all
end

def new
    @venue = Venue.new
end

def create
      @venue = Venue.create(venue_params)
      redirect_to venue_path(@venue)
end

def show
    @venue = Venue.find_by(id: params[:id])
end

def edit
    if logged_in?
        @venue = Venue.find_by(id: params[:id])
    else  
        redirect_to '/'
    end
end

def update
    if logged_in?
        @venue = Venue.find_by(id: params[:id])
        if @venue.update(venue_params)
            redirect_to venue_path
        else 
            render :'venues/edit'
        end
    end
end


private

def venue_params
    params.require(:venue).permit(:name, :street_address, :city, :state, :zipcode, :seats)
end


end