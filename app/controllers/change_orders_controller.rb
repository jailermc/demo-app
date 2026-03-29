class ChangeOrdersController < ApplicationController
  before_action :set_change_order, only: [:show, :show_alternative, :edit, :update, :destroy]

  # GET /change_orders
  def index
    @change_orders = ChangeOrder.where(cost_sheet_id: params[:parametro]).order(:daily_number)
  end

  # GET /change_orders/1
  def show
    @variante = @change_order.cost_sheet_id
    @cost_sheet = CostSheet.find(@variante)
  end

  def show_alternative
    @variante = @change_order.cost_sheet_id
    @cost_sheet = CostSheet.find(@variante)
  end
  # GET /change_orders/new
  def new
    @variante = params[:parametro]
    @cost_sheet = CostSheet.find(@variante)
    @change_order = ChangeOrder.new
  end

  # GET /change_orders/1/edit
  def edit
    @variante = @change_order.cost_sheet_id
  end

  # POST /change_orders
  def create
    @change_order = ChangeOrder.new(change_order_params)
    @change_order.daily_number = ChangeOrder.generate_daily_number(@change_order.cost_sheet_id)
    if @change_order.save
      redirect_to @change_order, notice: 'Change order was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /change_orders/1
  def update
    if @change_order.update(change_order_params)
      redirect_to @change_order, notice: 'Change order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /change_orders/1
  def destroy
    @change_order.destroy
    redirect_to request.referer || change_orders_url, notice: 'Change order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_change_order
      @change_order = ChangeOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def change_order_params
      params.require(:change_order).permit(:mdefault1, :mdescription1, :mtotal1, :mdefault2, :mdescription2, :mtotal2, :mdefault3, :mdescription3, :mtotal3, :cost, :cost_sheet_id, :cname, :address, :phone, :date, :commit, :job, :email, :vendor, :code, :job_site, :Contract, :corder1, :corder2, :corder3, :corder4, :corder5, :total, :description, :number)
    end
end
