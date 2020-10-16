module EventsHelper

def ok_to_edit?
    if logged_in? && current_user != nil  && @event.user_id == session[:user_id]
        return true
    end 
end

def event_by_state
    uniq_states = []
    venues = Venue.all
    venues.collect do |venue|
        uniq_states.push(venue.state)
    end
    uniq_states_return = uniq_states.uniq
    #byebug
end

    
end
