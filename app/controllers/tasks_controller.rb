class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  # def show
  # end

  # GET /tasks/new
  def new
		@zone = Zone.find(params[:zone_id])
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
		@zone = @task.zone
  end

  # POST /tasks or /tasks.json
  def create
		#TODO: This is a hack.  I need to figure out how to do this properly.
		total_days = (params[:task][:Weeks].to_i * 7) + (params[:task][:Days].to_i) + (params[:task][:Months].to_i * 30)
		inspected_on = Date.parse(params[:task][:offset])
		zone = Zone.find(params[:task][:zone_id])
		@task = Task.new(zone: zone, 
										inspection_period: total_days, 
										name: params[:task][:name], 
										# inspected_on: Date.today.advance(days: -(total_days.to_f * 0.1).to_i)
										# inspected_on: Date.today.advance(days: (params[:task][:offset].to_i)),
										inspected_on: inspected_on,
										icon: params[:task][:icon],
										alert: params[:task][:alert]
		)
    # @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to zone_url(@task.zone_id), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to zone_url(@task.zone), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

	def inspect
		@task = Task.find(params[:id])
		@task.inspected_on = Date.today
    respond_to do |format|
      if @task.save
        format.html { redirect_to zone_url(@task.zone_id), notice: "Task was successfully inspected." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
	end

	def snooze
		@task = Task.find(params[:id])
		snooze_days = params[:snooze_days].to_i
		@task.snoozed_until = Date.today.advance(days: snooze_days)
    respond_to do |format|
      if @task.save
        format.html { redirect_to zone_url(@task.zone_id), notice: "Task was successfully inspected." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:zone_id, :months, :weeks, :days, :icon, :alert, :offset)
    end
end
