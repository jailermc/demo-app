class RoisController < ApplicationController
  before_action :set_roi, only: [:show, :edit, :update, :destroy]

  # GET /rois
  def index
    @rois = Roi.all
  end

  # GET /rois/1
  def show
  end

  # GET /rois/new
  def new
    @roi = Roi.new
  end

  # GET /rois/1/edit
  def edit
  end

  # POST /rois
  def create
    @roi = Roi.new(roi_params)

    if @roi.save
      redirect_to @roi, notice: 'Roi was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /rois/1
  def update
    if @roi.update(roi_params)
      redirect_to @roi, notice: 'Roi was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rois/1
  def destroy
    @roi.destroy
    redirect_to rois_url, notice: 'Roi was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roi
      @roi = Roi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def roi_params
      params.fetch(:roi, {})
    end
end
