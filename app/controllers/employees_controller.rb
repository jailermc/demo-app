class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  def show
    
      @selected =  case @employee.function
              when 1
                'LABOR'
              when 2
                'OPERATOR'
              when 3
                'SUPERVISOR'
              when 4
                'DRIVER'
              else
                ''
                   end

      @active =  case @employee.active1
                   when 0
                     'NO'
                 when 1
                   'YES'
                   else
                     'N/A'
                 end

      @cost_sheet = @employee.cost_sheet_id ? CostSheet.find(@employee.cost_sheet_id) : "N/A"

  end
  # GET /employees/new
  def new
    @employee = Employee.new
    @cost_sheet = CostSheet.all
    @selected_project_id = 0
  end

  # GET /employees/1/edit
  def edit
    @selected =  case @employee.function
                 when 1
                   1
                 when 2
                   2
                 when 3
                   3
                 when 4
                   4
                 else
                   0
                 end
    
    @active =  case @employee.active1
                 when 1
                   1
                 else
                   2
               end
    @cost_sheet = CostSheet.all
    @selected_project_id = @employee.cost_sheet_id
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to @employee, notice: 'Employee was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Employee was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
    redirect_to employees_url, notice: 'Employee was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:name, :lastname, :phone, :active1, :function, :project, :cost_sheet_id)
    end
end
