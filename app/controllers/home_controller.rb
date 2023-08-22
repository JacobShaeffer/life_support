class HomeController < ApplicationController
  def index
    @zones = Zone.where(zone_id: nil)
		@expired = Array.new()
		@upcomming = Array.new()

		today = Date.today
		for zone in @zones
			for task in zone.tasks

				alert = task.alert || 7

				days_to_inspection = (task.inspected_on.advance(:days => task.inspection_period) - today).to_i 
				if days_to_inspection <= 0
					@expired.append(task)
				elsif days_to_inspection <= alert
					@upcomming.append(task)
				end

			end
		end

  end
end
