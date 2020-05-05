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
    end

    def index
        @event = Event.all.order("created_at DESC")
    end

    private

        def event_params
            params.require(:event).permit(:name, :description, :location, :date)
        end
end