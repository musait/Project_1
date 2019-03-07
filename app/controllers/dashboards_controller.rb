class DashboardsController < ApplicationController


    def index 
        @user = User.all 
        @formation = Formation.all 
        @event = Event.all 
    end 
end