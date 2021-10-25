class EventsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		issue = Issue.find_by(number: params[:number])

		if issue.present?
			events = issue.events.order(created_at: :asc).select(:action, :created_at)

			render json: events.to_json(except: :id)

		else
			render json: [error: 'issue not found']
		end
	end

	def create
	
		event = Event.new(action: params[:issue][:state], issue: Issue.find_or_create_by(number: params[:issue][:number]))

		if event.save
    	render json: { head: :ok }
		else
			render json: event.errors
		end
	end
end