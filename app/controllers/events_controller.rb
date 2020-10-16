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
        # get_event
    end

def destroy
    if logged_in?
    @user = current_user
    user_ok?(@user)
    # get_event
    if user.id == @event.user_id 
        @event.destroy
        redirect_to user_events_path(@user)
    end
    redirect_to '/'
    end

end

def edit
    if logged_in?
        @user = current_user
        user_ok?(@user)
    else
        redirect_to '/'
    end
end

def update
    if logged_in?
        @user = current_user
        user_ok?(@user)
        @event.update(event_params)
        redirect_to user_event_path(@user, @event)
        else  
            redirect_to '/'
        end
end




    private

def event_params
    params.require(:event).permit(:name, :venue_id, :curtain, :user_id)
end

def get_event
    @event = Event.find_by(id: params[:id])
end


end
