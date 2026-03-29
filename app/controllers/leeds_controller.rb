class LeedsController < ApplicationController
  before_action :set_leed, only: [:show, :edit, :update, :destroy]

  # GET /leeds
  def index
    @leeds = Leed.all
  end

  # GET /leeds/1
  def show
  end

  # GET /leeds/new
  def new
    @leed = Leed.new
    @daily = Dailylog.where cost_sheet_id: params[:parametro]
    @cost_sheet = CostSheet.find(params[:parametro])
    @concrete = @daily&.sum(:tconcrete) || 0
    @tasphalt = @daily&.sum(:tasphalt) || 0
    @tfill = @daily&.sum(:tfill) || 0
    @tvegetation = @daily&.sum(:tvegetation) || 0
    @ttrash = @daily&.sum(:ttrash) || 0
    @tfill = @daily&.sum(:tfill) || 0
    @location = @daily.first.location
    @ferrous = @cost_sheet.ferrous
    @nonferrous = @cost_sheet.nonferrous
    @misc = @cost_sheet.misc
  end
  # GET /leeds/1/edit
  def edit
    @location = @leed.project
    @concrete = @leed.landfill2
    @tasphalt = @leed.landfill1
    @tfill = @leed.landfill2
    @tvegetation = @leed.landfill17
    @cttrash = @leed.landfill16
    @tfill = @leed.landfill19
    @ferrous = @leed.recycled4
    @nonferrous = @leed.recycled5
    @misc = @leed.recycled18
  end

  # POST /leeds
  def create
    @leed = Leed.new(leed_params)

    if @leed.save
      redirect_to @leed, notice: 'Leed was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /leeds/1
  def update
    if @leed.update(leed_params)
      redirect_to @leed, notice: 'Leed was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /leeds/1
  def destroy
    @leed.destroy
    redirect_to leeds_url, notice: 'Leed was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leed
      @leed = Leed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leed_params
      params.require(:leed).permit(:method19, :landfill19, :recycled19, :salvage19, :reused19, :total19, :method18, :landfill18, :recycled18, :salvage18, :reused18, :total18, :method1, :landfill1, :recycled1, :salvage1, :reused1, :total1, :method2, :landfill2, :recycled2, :salvage2, :reused2, :total2, :method3, :landfill3, :recycled3, :salvage3, :reused3, :total3, :method4, :landfill4, :recycled4, :salvage4, :reused4, :total4, :method5, :landfill5, :recycled5, :salvage5, :reused5, :total5, :method6, :landfill6, :recycled6, :salvage6, :reused6, :total6, :method7, :landfill7, :recycled7, :salvage7, :reused7, :total7, :method8, :landfill8, :recycled8, :salvage8, :reused8, :total8, :method9, :landfill9, :recycled9, :salvage9, :reused9, :total9, :method10, :landfill10, :recycled10, :salvage10, :reused10, :total10, :method11, :landfill11, :recycled11, :salvage11, :reused11, :total11, :method12, :landfill12, :recycled12, :salvage12, :reused12, :total12, :method13, :landfill13, :recycled13, :salvage13, :reused13, :total13, :method14, :landfill14, :recycled14, :salvage14, :reused14, :total14, :method15, :landfill15, :recycled15, :salvage15, :reused15, :total15, :method16, :landfill16, :recycled16, :salvage16, :reused16, :total16, :method17, :landfill17, :recycled17, :salvage17, :reused17, :total17, :date, :project, :tconswaste, :tdivewaste, :porcen, :tlandwaste)
    end
end
