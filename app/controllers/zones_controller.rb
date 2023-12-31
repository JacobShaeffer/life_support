class ZonesController < ApplicationController
  before_action :set_zone, only: %i[ show edit update destroy ]

  # GET /zones or /zones.json
  def index
    @zones = Zone.where(zone_id: nil)
  end

  # GET /zones/1 or /zones/1.json
  def show
		@zones = Zone.where(zone_id: @zone.id)
  end

  # GET /zones/new
  def new
    @zone = Zone.new
		@zones = Zone.all
		@icons = [
			"airplane",
			"airplane-engines",
			"airplane-engines-fill",
			"airplane-fill",
			"alarm",
			"alarm-fill",
			"alexa",
			"align-bottom",
			"align-center",
			"align-end",
			"align-middle",
			"align-start",
			"align-top",
			"alipay",
			"alt",
			"amd",
			"android",
			"android2",
			"app",
			"app-indicator",
			"apple",
			"archive",
		]
  end

  # GET /zones/1/edit
  def edit
  end

  # POST /zones or /zones.json
  def create
    @zone = Zone.new(name: params[:zone][:name], zone_id: params[:zone][:parent_id], color: params[:zone][:color])

    respond_to do |format|
      if @zone.save
        format.html { redirect_to zone_url(@zone), notice: "Zone was successfully created." }
        format.json { render :show, status: :created, location: @zone }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zones/1 or /zones/1.json
  def update
    respond_to do |format|
      if @zone.update(zone_params)
        format.html { redirect_to zone_url(@zone), notice: "Zone was successfully updated." }
        format.json { render :show, status: :ok, location: @zone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zones/1 or /zones/1.json
  def destroy
    @zone.destroy

    respond_to do |format|
      format.html { redirect_to zones_url, notice: "Zone was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zone
      @zone = Zone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def zone_params
      params.require(:zone).permit(:name, :parent_id, :color)
    end
end
