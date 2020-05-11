module ApplicationHelper

    def logged_on?
        session[:user_id] ? true : false
    end

end
