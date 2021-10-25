require 'rails_helper'

RSpec.describe "Events management", type: :request do

	let(:params_no_number) { { "issue" => { number: '', state: 'open' } } }
	let(:params_no_state) { { "issue" => { number: '123456', state: '' } } }
	let(:params) { { "issue" => { number: '123457', state: 'open' } } }

	it 'fails when issue number is absent' do
		post '/', params: params_no_number
		expect(JSON.parse(response.body)['issue_id']).to be_present
		expect(JSON.parse(response.body)['issue_id']).to eq(["can't be blank"])
	end

	it 'fails when state is absent' do
		post '/', params: params_no_state

		expect(JSON.parse(response.body)['action']).to be_present
		expect(JSON.parse(response.body)['action']).to eq(["can't be blank"])
	end

	it 'successfully saves when params are present' do
		post '/', params: params

		expect(Event.last.issue.number).to eq(123457)
	end
	
end