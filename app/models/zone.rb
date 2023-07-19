class Zone < ApplicationRecord
  belongs_to :zone, optional: true
	has_many :zones, dependent: :destroy
	has_many :tasks, dependent: :destroy
end
