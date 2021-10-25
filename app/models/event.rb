class Event < ApplicationRecord
	validates :action, :issue_id, presence: true
	belongs_to :issue
end
