class DailylogsController < ApplicationController
  before_action :set_dailylog, only: [:show, :show_alternative, :edit, :update, :destroy]

  # GET /dailylogs
  def index
    @dailylogs = Dailylog.where(cost_sheet_id: params[:parametro]).order(:daily_number)
  end

  # GET /dailylogs/1
  def show
    @variante = @dailylog.cost_sheet_id
    @cost_sheet = CostSheet.find(@variante)
    @estimates = Estimated.find(@cost_sheet.vsx)
    @selector = []
    (1..12).each do |i|
      labor = "alabor#{i}"
      esti = case @dailylog.send(labor)
             when 1
               'LABOR'
             when 2
               'OPERATOR'
             when 3
               'SUPERVISOR'
             when 4
               'DRIVER'
             else
               ""
             end
      @selector << esti
    end
    
    @whater_sel = case @dailylog.whater
                  when 1
                    'RAINY'
                  when 2
                    'CLOUDY'
                  when 3
                    'SUNNY'
                  when 4
                    'DUSTY'
                  when 5
                    'SNOW'
                  when 6
                    'FOG'
                  else
                    ''
                  end
  end

  # GET /dailylogs/new
  def show_alternative
    @variante = @dailylog.cost_sheet_id
    @cost_sheet = CostSheet.find(@variante)
    @selector = []
    (1..12).each do |i|
      labor = "alabor#{i}"
      esti = case @dailylog.send(labor)
             when 1
               'LABOR'
             when 2
               'OPERATOR'
             when 3
               'SUPERVISOR'
             when 4
               'DRIVER'
             else
               ""
             end
      @selector << esti
    end

    @whater_sel = case @dailylog.whater
                  when 1
                    'RAINY'
                  when 2
                    'CLOUDY'
                  when 3
                    'SUNNY'
                  when 4
                    'DUSTY'
                  when 5
                    'SNOW'
                  when 6
                    'FOG'
                  else
                    ''
                  end
  end


  def new

    @variante = params[:parametro]
    @cost_sheet = CostSheet.find(@variante)
    @estimates = Estimated.find(@cost_sheet.vsx)
    @hour = []
    @nume = []
    @num = []
    @selector = []
    @dailylog = Dailylog.new
  end

  # GET /dailylogs/1/edit
  def edit
    @variante = @dailylog.cost_sheet_id
    @cost_sheet = CostSheet.find(@variante)
    @estimates = Estimated.find(@cost_sheet.vsx)
    @num = []
    (1..7).each do |i|
      equip = "manqty#{i}"
      esti =  @dailylog.send(equip)
      @num << esti
    end

    @nume = []
    (1..12).each do |i|
      equip = "equipqty#{i}"
      esti =  @dailylog.send(equip)
      @nume << esti
    end
    @hour = []
    (1..12).each do |i|
      equip = "hour#{i}"
      esti =  @dailylog.send(equip)
      @hour << esti
    end

    @selector = []
    (1..12).each do |i|
      labor = "alabor#{i}"
      esti = case @dailylog.send(labor)
             when 0
               0
             when 1
               1
             when 2
               2
             when 3
               3
             else
               4
             end
      @selector << esti
    end

    @whater_sel = @dailylog.whater
  end

  # POST /dailylogs
  def create
    @dailylog = Dailylog.new(dailylog_params)
    @dailylog.daily_number = Dailylog.generate_daily_number(@dailylog.cost_sheet_id)
    if @dailylog.save
      redirect_to  @dailylog, notice: 'Dailylog was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dailylogs/1
  def update
    if @dailylog.update(dailylog_params)
      redirect_to  @dailylog, notice: 'Dailylog was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dailylogs/1
  def destroy
    @dailylog.destroy
    redirect_to request.referer || dailylogs_url, notice: 'Dailylog was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dailylog
      @dailylog = Dailylog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
  def dailylog_params
    params.require(:dailylog).permit(:fuel, :mtransporter1, :mpricing1, :mtotal1, :mtransporter2, :mpricing2, :mtransporter3, :mpricing3, :mtotal3, :mtransporter4, :mpricing4, :mtotal4, :mtransporter5, :mpricing5, :mtotal5, :mtransporter6, :mpricing6, :mtotal6, :pmisellaneous, :omanqty7, :ohour7, :smanqty7, :shour7, :dmanqty7, :dhour7, :omanqty8, :ohour8, :smanqty8, :shour8, :dmanqty8, :dhour8, :omanqty9, :ohour9, :smanqty9, :shour9, :dmanqty9, :dhour9, :omanqty10, :ohour10, :smanqty10, :shour10, :dmanqty10, :dhour10, :omanqty11, :ohour11, :smanqty11, :shour11, :dmanqty11, :dhour11, :omanqty12, :ohour12, :smanqty12, :shour12, :dmanqty12, :dhour12, :overl, :overo, :overs, :overd, :xtransporter1, :xqty1, :xpricing1, :xtotal10, :xtransporter2, :xqty2, :xpricing2, :xtotal20, :xtransporter3, :xqty3, :xpricing3, :xtotal30, :xtransporter4, :xqty4, :xpricing4, :xtotal40, :trebar, :rebar, :prebar, :rtotal4, :ctotal10, :cpricing20, :ctotal20, :cpricing30, :ctotal30, :cpricing40, :ctotal40, :apricing20, :atotal20, :atransporter3, :fpricing10, :ftotal10, :fpricing20, :ftotal20, :vpricing10, :vtotal10, :vpricing20, :vtotal20, :tpricing10, :ttotal10, :tpricing20, :ttotal20, :aqty3, :apricing3, :atotal3, :atransporter4, :aqty4, :apricing4, :atotal4, :ftransporter3, :fqty3, :fpricing3, :ftotal3, :ftransporter4, :fqty4, :fpricing4, :ftotal4, :vtransporter3, :vqty3, :vpricing3, :vtotal3, :vtransporter4, :vqty4, :vpricing4, :vtotal4, :ttransporter3, :tqty3, :tpricing3, :ttotal3, :ttransporter4, :tqty4, :tpricing4, :ttotal4, :rtransporter1, :rqty1, :rpricing1, :rtotal1, :rtransporter2, :rqty2, :rpricing2, :rtotal2, :rtransporter3, :rqty3, :rpricing3, :rtotal3, :rtransporter4, :rqty4, :rpricing4, :trock, :rock, :prock, :omanqty1, :ohour1, :smanqty1, :shour1, :dmanqty1, :dhour1, :omanqty2, :ohour2, :smanqty2, :shour2, :dmanqty2, :dhour2, :omanqty3, :ohour3, :smanqty3, :shour3, :dmanqty3, :dhour3, :omanqty4, :ohour4, :smanqty4, :shour4, :dmanqty4, :dhour4, :omanqty5, :ohour5, :smanqty5, :shour5, :dmanqty5, :dhour5, :omanqty6, :ohour6, :smanqty6, :shour6, :dmanqty6, :dhour6, :totallqty, :totaloqty, :totalsqty, :totaldqty, :totalhoursl, :totalhourso, :totalhourss, :totalhoursd, :cqty1, :cpricing1, :ctotal1, :cqty2, :cpricing2, :ctotal2, :cqty3, :cpricing3, :ctotal3, :cqty4, :cpricing4, :ctotal4, :aqty1, :apricing1, :atotal1, :aqty2, :apricing2, :atotal2, :fqty1, :fpricing1, :ftotal1, :fqty2, :fpricing2, :ftotal2, :vqty1, :vpricing1, :vtotal1, :vqty2, :vpricing2, :vtotal2, :tqty1, :tpricing1, :ttotal1, :tqty2, :tpricing2, :ttotal2, :ctransporter2, :ctransporter3, :ctransporter4, :atransporter1, :ftransporter1, :vtransporter1, :ttransporter1, :atransporter2, :ftransporter2, :vtransporter2, :ttransporter2, :ctransporter1, :ctruck1, :alabor1, :alabor2, :alabor3, :alabor4, :alabor5, :alabor6, :alabor7, :alabor8, :alabor9, :alabor10, :alabor11, :alabor12, :labor100, :labor8, :manqty8, :hour8, :equip8, :equipqty8, :labor9, :manqty9, :hour9, :equip9, :equipqty9, :labor10, :manqty10, :hour10, :equip10, :equipqty10, :labor11, :manqty11, :hour11, :equip11, :equipqty11, :labor12, :manqty12, :hour12, :equip12, :equipqty12, :tvegetation, :tconcrete, :tasphalt, :tfill, :tvegitation, :ttrash, :aconcrete, :aasphalt, :afill, :avegitation, :atrash, :vegitation, :dconcrete, :pconcrete, :dasphalt, :pasphalt, :dfill, :pfill, :dvegitation, :pvegitation, :dtrash, :ptrash, :comments, :concrete, :asphalt, :fill, :trash, :report, :hour1, :hour2, :hour3, :hour4, :hour5, :hour6, :hour7, :thours, :equip3, :cname, :pname, :date, :whater, :labor1, :manqty1, :equip1, :equipqty1, :labor2, :manqty2, :equip2, :equipqty2, :labor3, :manqty3, :equipqty3, :labor4, :manqty4, :equip4, :equipqty4, :labor5, :manqty5, :equip5, :equipqty5, :labor6, :manqty6, :equip6, :equipqty6, :labor7, :manqty7, :equip7, :equipqty7, :mantotal, :equiptotal, :remarks,:name_project, :workers, :hours, :totalh, :location, :coments, :wather, :date1, :manpower, :equipment, :qtye, :qtyem, :cost_sheet_id, :ctickets1, avatar: [] )
  end
end
