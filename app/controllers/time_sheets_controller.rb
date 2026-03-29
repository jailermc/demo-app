class TimeSheetsController < ApplicationController
  before_action :set_time_sheet, only: [:show, :edit, :update, :destroy]

  # GET /time_sheets
  def index
    @time_sheets = TimeSheet.where(cost_sheet_id: params[:parametro])
  end

  # GET /time_sheets/1
  def show
    @employees = Employee.where(cost_sheet_id: @time_sheet.cost_sheet_id)
  end

  # GET /time_sheets/new
  def new
    @time_sheets = []
    @time_sheet = TimeSheet.new
    @employees = Employee.where(cost_sheet_id: params[:parametro])
    @employee_data = CostSheet.find(params[:parametro]).address
    @selected_project_id = 0
    @variante = params[:parametro]
  end

  # GET /time_sheets/1/edit
  def edit
    @time_sheet = TimeSheet.find(params[:id])
    @employees = Employee.where(cost_sheet_id: @time_sheet.cost_sheet_id)
    @employee_data = @time_sheet.address
    @variante = @time_sheet.cost_sheet_id
  end

  # POST /time_sheets
  def create
    @time_sheet = TimeSheet.new(time_sheet_params)
    if @time_sheet.save
      redirect_to @time_sheet, notice: "Time Sheet data saved successfully."
    else
      render :new
    end
  end

  # PATCH/PUT /time_sheets/1
  def update
    if @time_sheet.update(time_sheet_params)
      redirect_to @time_sheet, notice: 'Time sheet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /time_sheets/1
  def destroy
    @time_sheet.destroy
    redirect_to time_sheets_url, notice: 'Time sheet was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_sheet
      @time_sheet = TimeSheet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
  def time_sheet_params
    params.require(:time_sheet).permit(:cost_sheet_id, :address, :week,
                                       *(0..19).flat_map { |index| ["mon_#{index}", "tue_#{index}", "wed_#{index}", "thr_#{index}", "fri_#{index}", "sat_#{index}", "sun_#{index}", "total_#{index}"] }
    )
  end
end