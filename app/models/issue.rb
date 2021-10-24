class Issue < ApplicationRecord
	validates :code, presence: true
	has_many :events
end
