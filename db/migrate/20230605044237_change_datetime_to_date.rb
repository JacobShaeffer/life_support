class ChangeDatetimeToDate < ActiveRecord::Migration[7.0]
  def change
		change_column :tasks, :inspected_on, :date
		add_column :tasks, :snoozed_until, :date
		remove_column :tasks, :snoozed_on
		remove_column :tasks, :snooze_duration
  end
end
