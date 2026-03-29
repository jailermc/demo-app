class RfisController < ApplicationController
  before_action :set_rfi, only: [:show, :edit, :update, :destroy]

  # GET /rfis
  def index
    @rfis = Rfi.where(estimateds_id: params[:parametro])
  end

  # GET /rfis/1
  def show
  end

  # GET /rfis/new
  def new
    @rfi = Rfi.new
  end

  # GET /rfis/1/edit
  def edit
  end

  # POST /rfis
  def create
    @rfi = Rfi.new(rfi_params)
    if @rfi.save
      redirect_to @rfi, notice: 'Rfi was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /rfis/1
  def update
    if @rfi.update(rfi_params)
      redirect_to @rfi, notice: 'Rfi was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rfis/1
  def destroy
    @rfi.destroy
    redirect_to request.referer || rfis_url, notice: 'Rfi was successfully destroyed.'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rfi
      @rfi = Rfi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rfi_params
      params.require(:rfi).permit(:estimateds_id, :select1, :select4, :select2, :select5, :select3, :select6, :pname, :location, :number, :date, :pid, :drawing, :overview, :referenced, :nochange1, :nochange2, :increase_cost, :increase_time, :decrease_cost, :decrease_time, :request, :name_request, :signature1, :signature2, :response, :date2, :status, :name_responding, :cname)
    end
end
