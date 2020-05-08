class EventsController < ApplicationController

    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(event_params)

        if @event.save
            redirect_to "/events"
        else
            render "events/new"
        end
    end

    def show
        @event = Event.find(params[:id])
        @user = current_user

    end

    def index
        #@event = Event.all.order("created_at DESC")
        @events = Event.all
        @upcoming_events = @events.upcoming_events
        @previous_events = @events.previous_events
    end

    private

        def event_params
            params.require(:event).permit(:name, :description, :location, :date)
        end
end