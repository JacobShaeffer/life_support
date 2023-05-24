require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "should create task" do
    visit tasks_url
    click_on "New task"

    fill_in "Inspected on", with: @task.inspected_on
    fill_in "Inspection period", with: @task.inspection_period
    fill_in "Snooze duration", with: @task.snooze_duration
    fill_in "Snoozed on", with: @task.snoozed_on
    fill_in "Zone", with: @task.zone_id
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "should update Task" do
    visit task_url(@task)
    click_on "Edit this task", match: :first

    fill_in "Inspected on", with: @task.inspected_on
    fill_in "Inspection period", with: @task.inspection_period
    fill_in "Snooze duration", with: @task.snooze_duration
    fill_in "Snoozed on", with: @task.snoozed_on
    fill_in "Zone", with: @task.zone_id
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "should destroy Task" do
    visit task_url(@task)
    click_on "Destroy this task", match: :first

    assert_text "Task was successfully destroyed"
  end
end
