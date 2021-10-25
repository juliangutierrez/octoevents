require 'rails_helper'

RSpec.describe "List events", type: :request do
	
	before :each do
		issue = Issue.create(number: 123456)
		@event1 = Event.create(action: 'open', issue: issue)
		event2 = Event.create(action: 'closed', issue: issue)
		event3 = Event.create(action: 'open', issue: issue)
	end

	it 'gets all events' do
		get '/issues/123456/events'
		
		expect(JSON.parse(response.body).count).to eq(3)
	end

	it 'has action and created_at columns' do
		get '/issues/123456/events'

		expect(JSON.parse(response.body).first.count).to eq(2)
		expect(JSON.parse(response.body).first['action']).to eq(@event1.action)
		expect(JSON.parse(response.body).first['created_at'].to_date).to eq(@event1.created_at.to_date)
	end

	it 'gives an error if issue is not found' do
		get '/issues/123457/events'

		expect(JSON.parse(response.body).count).to eq(1)
		expect(JSON.parse(response.body).first['error']).to eq('issue not found')
	end
	
end