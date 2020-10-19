class EventsController < ApplicationController
    before_action :get_event, except: [:index, :new, :create]

def index
    if params[:user_id]
        @user = User.find_by(id: params[:user_id])
        @events = @user.events
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
        @user = current_user if !!current_user
    end

def destroy
    if logged_in?
        @user = current_user
        user_ok?(@user)
            if @user.id == @event.user_id 
                @event.destroy
                redirect_to user_events_path(@user)
            end
        else 
            redirect_to '/'
        end
end

def edit
    if logged_in?
        @user = current_user
        user_ok?(@user)
        redirect_to '/' if @user.id != @event.user_id
    else
        redirect_to '/'
    end
end

def update
    if logged_in?
        @user = current_user
        user_ok?(@user)
        redirect_to '/' if @user.id != @event.user_id
            if @event.update(event_params)
                redirect_to user_event_path(@user, @event)
            else  
                render :'events/edit'
            end
    else  
        redirect_to '/'
    end
end


def search
   the_event = search_return(params[:state_select])
    if the_event == nil || the_event == []
        @errors = "There are no listed performances in #{params[:state_select]}."
    else 
        @events = the_event 
    end
    render :search
end


private

def event_params
    params.require(:event).permit(:name, :venue_id, :curtain, :user_id)
end

def get_event
    @event = Event.find_by(id: params[:id])
end

def search_return(state)
    state_events = []
    venue_list = []
    results = []
    Venue.by_state(state).map do |venue|
        venue_list.push(venue)
    end
    venue_list.map do |venue|
        state_events.push(venue.events) if venue.events.count != 0
        end
    if state_events != []
         c = state_events.count
        c.times do |i|
        state_events[i].each do |event|
            results.push(event)
        end
    end
    results
    end 
end

end