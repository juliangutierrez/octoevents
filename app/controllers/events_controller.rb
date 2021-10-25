class EventsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
	end

	def create
	
		event = Event.new(action: params[:issue][:state], issue: Issue.find_or_create_by(number: params[:issue][:number]))

		if event.save
    	render :json => { head: :ok }
		else
			byebug
			render json: event.errors
		end
	end
end