class UsersController < ApplicationController
    helper_method :current_user

    # def current_user
    #     if session[:user_id]
    #         @current_user ||= User.find(session[:user_id])
    #     else
    #         @current_user = nil
    #     end
    # end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id

        if @user.save
            redirect_to users_url
        else
            render "users/new"
        end
    end

    def show
        @user = User.find(params[:id])
        @upcoming_events = current_user.events.upcoming_events
        @previous_events = current_user.events.previous_events
    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :username)
        end
end