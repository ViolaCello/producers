module EventsHelper

def ok_to_edit?
    if logged_in? && current_user != nil  && @event.user_id == session[:user_id]
        return true
    end
    
end


    
end
