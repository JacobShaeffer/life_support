class Zone < ApplicationRecord
  belongs_to :zone, optional: true
	has_many :zones
	has_many :tasks
end
