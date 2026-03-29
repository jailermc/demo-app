class CostSheetsController < ApplicationController
  before_action :set_cost_sheet, only: %i[show edit update destroy]
  # GET /cost_sheets
  def index
    if params[:year].present?
      selected_year = params[:year].to_i

      if params[:month1].present?

        selected_month = params[:month1].to_i
        start_date = Time.zone.local(selected_year, selected_month, 1)
        end_date = start_date.end_of_month
      else

        start_date = Time.zone.local(selected_year, 1, 1)
        end_date = start_date.end_of_year
      end
    elsif params[:searchbox].present?

      start_date = Time.zone.at(0)
      end_date = Time.zone.today.end_of_year
    else

      start_date = Time.zone.at(0)
      end_date = Time.zone.today.end_of_month.end_of_day
    end
    @cost_sheets = CostSheet.search(params[:searchbox]).where(created_at: start_date..end_date).order(created_at: :desc)
    @cost_sheets_count = @cost_sheets.count
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /cost_sheets/1
  def show
    dato = @cost_sheet.vsx
    @estimated = Estimated.find(dato)
    @daily = Dailylog.where cost_sheet_id: params[:id]
    @change_order = ChangeOrder.where cost_sheet_id: params[:id]
    @days_labor = @daily.where.not(totallqty: [nil, 0]).count
    @days_op = @daily.where.not(totaloqty: [nil, 0]).count
    @days_sup = @daily.where.not(totalsqty: [nil, 0]).count
    @days_driver = @daily.where.not(totaldqty: [nil, 0]).count
    @overl = @daily.where.not(overl: [nil, 0]).count
    @overo = @daily.where.not(overo: [nil, 0]).count
    @overs = @daily.where.not(overs: [nil, 0]).count
    @overd = @daily.where.not(overd: [nil, 0]).count
    change_number_by_name
    daily_load
    count_days
  end

  # GET /cost_sheets/new
  def new
    @daily = Dailylog.where cost_sheet_id: params[:id]
    @change_order = ChangeOrder.where cost_sheet_id: params[:id]
    @estimated = Estimated.find(params[:parametro])
    @cost_sheet = CostSheet.new
    change_number_by_name
    @scrap = @cost_sheet.scrap
    qtyequim
    @summan1 = @daily&.sum(:manqty1)
    @expenses = @daily&.sum(:pmisellaneous)
    daily_load
    count_days
  end

  # GET /cost_sheets/1/edit
  def edit
      selector = @cost_sheet
      @estimated = Estimated.find(selector.vsx)
      change_number_by_name
      @equip = selector.eexcavator1
      @equip2 = selector.eexcavator2
      @equip3 = selector.scisso3
      @equip4 = selector.loader4
      @equip5 = selector.etrunck5
      @equip6 = selector.ebobcat6
      @daily = Dailylog.where cost_sheet_id: params[:id]
      @change_order = ChangeOrder.where cost_sheet_id: params[:id]
      @days_labor = @daily.where.not(totallqty: [nil, 0]).count
      @days_op = @daily.where.not(totaloqty: [nil, 0]).count
      @days_sup = @daily.where.not(totalsqty: [nil, 0]).count
      @days_driver = @daily.where.not(totaldqty: [nil, 0]).count
      @overl = @daily.where.not(overl: [nil, 0]).count
      @overo = @daily.where.not(overo: [nil, 0]).count
      @overs = @daily.where.not(overs: [nil, 0]).count
      @overd = @daily.where.not(overd: [nil, 0]).count
      @expenses = @daily&.sum(:pmisellaneous)
      count_days
      qtyequim
      daily_load
  end

  # POST /cost_sheets
  def create
    @cost_sheet = CostSheet.new(cost_sheet_params)
    if @cost_sheet.save
      redirect_to @cost_sheet, notice: 'Cost sheet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cost_sheets/1
  def update
    if @cost_sheet.update(cost_sheet_params)
      redirect_to @cost_sheet, notice: 'Cost sheet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cost_sheets/1
  def destroy
    @cost_sheet.destroy
    redirect_to cost_sheets_url, notice: 'Cost sheet was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_cost_sheet
    @cost_sheet = CostSheet.find(params[:id])
    @daily = Dailylog.where cost_sheet_id: params[:id]
    @change_order = ChangeOrder.where cost_sheet_id: params[:id]
  end

    # Only allow a list of trusted parameters through.
  def cost_sheet_params
    params.require(:cost_sheet).permit(:mov_pdescription3, :mov_pqty3, :mov_pricing3, :mov_total3, :totalfuel,
                                       :eresult1, :eresult2, :eresult3, :eresult4, :eresult5, :eresult6, :eresult12, :eresult7, :eresult8, :eresult9, :eresult10, :eresult11, :mdescription32, :mqtysfft32, :mpricing32, :mtotal32, :mdescription31, :mqtysfft31, :mpricing31, :mtotal31, :mdescription19, :mqtysfft19, :mpricing19, :mtotal19, :mdescription20, :mqtysfft20, :mpricing20, :mtotal20, :ec_description3, :ec_qty3, :ec_pricing3, :ec_total3, :ec_description4, :ec_qty4, :ec_pricing4, :ec_total4, :ec_description5, :ec_qty5, :ec_pricing5, :ec_total5, :ec_total, :ec_totalvs, :tf_total, :tf_totalvs, :mov_pdescription2, :mov_pqty2, :mov_pricing2, :mov_total2, :per_total, :per_totalvs, :fuel1, :fdescription1, :fqtysflf1, :fdays1, :fpricing1, :ftotal1, :ftotal, :ftotalvs, :dailyexpenses, :pdescription8, :pqty8, :ppricing8, :ptotal8, :pmanager, :pemail, :pcell, :supervisor, :scell, :sdate, :fdate, :noc, :nocdate, :nocedate, :nto, :ntodate, :mdescription18, :mqtysfft18, :mpricing18, :mtotal18, :subdescription3, :subqtysfft3, :subpricing3, :subtotal3, :mdescription17, :mqtysfft17, :mpricing17, :mtotal17, :mdescription16, :mqtysfft16, :mpricing16, :mtotal16, :totalover1, :totalover2, :totalover3, :totalover4, :totaltotalover, :sumco, :pdescription7, :pqty7, :ppricing7, :ptotal7, :charge_cost, :vscontractor, :subdescription1, :subqtysfft1, :subpricing1, :subtotal1, :subdescription2, :subqtysfft2, :subpricing2, :subtotal2, :subtotaltotal, :tdescription6, :tqtyyds6, :tpricing6, :ttotal6, :salvagetotal, :tdescription5, :tqtysfft5, :ttotal5, :alabor10, :aemp10, :adays10, :ahours10, :apricing10, :atotal10, :alabor11, :aemp11, :adays11, :ahours11, :apricing11, :atotal11, :alabor12, :aemp12, :adays12, :ahours12, :apricing12, :atotal12, :edefault9, :edescription9, :eqty9, :edaywk9, :epricing9, :etotal9, :edefault10, :edescription10, :eqty10, :edaywk10, :epricing10, :etotal10, :edefault11, :edescription11, :eqty11, :edaywk11, :epricing11, :etotal11, :edefault12, :edescription12, :eqty12, :edaywk12, :epricing12, :etotal12, :ferrous, :nonferrous, :misc, :mdescription12, :mqtysfft12, :mpricing12, :mtotal12, :mdescription13, :mqtysfft13, :mpricing13, :mtotal13, :mdescription14, :mqtysfft14, :mpricing14, :mtotal14, :mdescription15, :mqtysfft15, :mpricing15, :mtotal15, :ahours1, :ahours2, :ahours3, :ahours4, :ahours5, :ahours6, :ahours7, :over1, :over2, :over3, :over4, :over5, :over6, :over7, :over8, :over9, :ahours8, :ahours9, :saw2, :sdescription2, :sqtysflf2, :sdays2, :spricing2, :stotal2, :saw3, :sdescription3, :sqtysflf3, :sdays3, :spricing3, :stotal3, :invoice, :name, :vsa, :vse, :vsm, :vst, :vsp, :vsx, :order4, :atotalvs, :etotalvs, :stotalvs, :ttotalvs, :ptotalvs, :mtotalvs, :totalvs, :order1, :order2, :scrap, :order3, :pool, :drivewall, :defaultfinaltext, :commercial, :order5, :concrete, :tloads, :ydsloads, :tyards1, :ydsf1, :tcontract, :totalcost1, :trash, :tloads, :tyards2, :ydssf2, :jobcost, :tprofit, :tprofitsalvage, :saw1, :mdescription9, :mqtysfft9, :mdays9, :mpricing9, :mtotal9, :mdescription11, :mqtysfft11, :mdays11, :mpricing11, :mtotal11, :address, :salvage, :name, :date1, :status, :date, :alabor1, :integer, :adescription1, :string, :adays1, :integer, :aemp1, :integer, :apricing1, :integer, :atotal1, :integer, :alabor2, :integer, :adescription2, :string, :adays2, :integer, :aemp2, :integer, :apricing2, :integer, :atotal2, :integer, :alabor3, :integer, :adescriptio3, :string, :adays3, :integer, :aemp3, :integer, :apricing3, :integer, :atotal3, :integer, :alabor4, :integer, :adescription4, :string, :adays4, :integer, :aemp4, :integer, :apricing4, :integer, :atotal4, :integer, :alabor5, :integer, :adescription5, :string, :adays5, :integer, :aemp5, :integer, :apricing5, :integer, :atotal5, :integer, :alabor6, :integer, :adescription6, :string, :adays6, :integer, :aemp6, :integer, :apricing6, :integer, :atotal6, :integer, :alabor7, :integer, :adescription7, :string, :adays7, :integer, :aemp7, :integer, :apricing7, :integer, :atotal7, :integer, :alabor8, :integer, :adescription8, :string, :adays8, :integer, :aemp8, :integer, :apricing8, :integer, :atotal8, :integer, :alabor9, :integer, :adescription9, :string, :adays9, :integer, :aemp9, :integer, :apricing9, :integer, :atotal9, :integer, :eexcavator1, :string, :edescription1, :string, :eqty1, :integer, :edaywk1, :integer, :epricing1, :integer, :etotal1, :integer, :eexcavator2, :string, :edescription2, :string, :eqty2, :integer, :edaywk2, :integer, :epricing2, :integer, :etotal2, :integer, :scisso3, :string, :edescription3, :string, :eqty3, :integer, :edaywk3, :integer, :epricing3, :integer, :etotal3, :integer, :loader4, :string, :edescription4, :string, :eqty4, :integer, :edaywk4, :integer, :epricing4, :integer, :etotal4, :integer, :etrunck5, :string, :edescription5, :string, :eqty5, :integer, :edaywk5, :integer, :epricing5, :integer, :etotal5, :integer, :ebobcat6, :string, :edescription6, :string, :eqty6, :integer, :edaywk6, :integer, :epricing6, :integer, :etotal6, :integer, :etotal, :integer, :edefault7, :string, :edescription7, :string, :eqty7, :integer, :edaywk7, :integer, :epricing7, :integer, :etotal7, :integer, :edefault8, :string, :edescription8, :string, :eqty8, :integer, :edaywk8, :integer, :epricing8, :integer, :etotal8, :integer, :ttrash1, :string, :tdescription1, :string, :tqtyyds1, :integer, :tdays1, :integer, :tpricing1, :integer, :tconcrete2, :string, :tdescription2, :string, :tqtyyds2, :integer, :tdays2, :integer, :tpricing2, :integer, :tasphalt3, :string, :tdescription3, :string, :tqtyyds3, :integer, :tdays3, :integer, :tpricing3, :integer, :ttotal, :integer, :pdemo1, :string, :pdescription1, :string, :pqty1, :integer, :pdays1, :integer, :ppricing1, :integer, :pplumbing2, :string, :pdescription2, :string, :pqty2, :integer, :pdays2, :integer, :ppricing2, :integer, :pelectical3, :string, :pdescription3, :string, :pqty3, :integer, :pdays3, :integer, :ppricing3, :integer, :pderm4, :string, :pdescription4, :string, :pqty4, :integer, :pdays4, :integer, :ppricing4, :integer, :ptree5, :string, :pdescription5, :string, :pqty5, :integer, :pdays5, :integer, :ppricing5, :integer, :pmechanical6, :string, :pdescription6, :string, :pqty6, :integer, :pdays6, :integer, :ppricing6, :integer, :ptotal, :string, :mmiscellaneous1, :string, :mdescription1, :string, :mqtysfft1, :integer, :mdays1, :integer, :mpricing1, :integer, :mdefault2, :string, :mdescription2, :string, :mqtysfft2, :integer, :mdays2, :integer, :mpricing2, :integer, :mdefault3, :string, :mdescription3, :string, :mqtysfft3, :integer, :mdays3, :integer, :mpricing3, :integer, :mtotal, :integer, :subtotal, :integer, :profit, :integer, :total, :integer, :sf, :persf, :adescriptio3, :tdescription4, :tqtyyds4, :tdays4, :tpricing4, :mdefault4, :mdescription4, :mqtysfft4, :mdays4, :mpricing4, :mdefault5, :mdescription5, :mqtysfft5, :mdays5, :mpricing5, :sdescription1, :sqtysflf1, :sdays1, :spricing1, :mdefault6, :mdescription6, :mqtysfft6, :mdays6, :mpricing6, :mdefault7, :mdescription7, :mqtysfft7, :mdays7, :mpricing7, :mdefault8, :mdescription8, :mqtysfft8, :mdays8, :mpricing8, :atotal, :stotal1, :stotal, :ttotal1, :ttotal2, :ttotal3, :ttotal4, :ptotal1, :ptotal2, :ptotal3, :ptotal4, :ptotal5, :ptotal6, :mtotal1, :mtotal2, :mtotal3, :mtotal4, :mtotal5, :mtotal6, :mtotal7, :mtotal8, :pptotal, :profitporcen)
  end

  def change_number_by_name
    @selector1 = []
    (1..12).each do |i|
      alabor = "alabor#{i}"
      esti =  case @estimated.send(alabor)
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
      @selector1 << esti
    end
  end

  def count_days
    @dayly_counts = []

    # Loop through columns from manqty1 to manqty12
    (1..12).each do |column_number|
      column_name = "alabor#{column_number}".to_sym
      count = @daily.where.not(column_name => [nil, 0]).count
      @dayly_counts << count
    end
  end

  def qtyequim
    @daily_equim1 = @daily&.sum(:equipqty1) || 0
    @daily_equim2 = @daily&.sum(:equipqty2) || 0
    @daily_equim3 = @daily&.sum(:equipqty3) || 0
    @daily_equim4 = @daily&.sum(:equipqty4) || 0
    @daily_equim5 = @daily&.sum(:equipqty5) || 0
    @daily_equim6 = @daily&.sum(:equipqty6) || 0
    @daily_equim7 = @daily&.sum(:equipqty7) || 0
    @daily_equim8 = @daily&.sum(:equipqty8) || 0
    @daily_equim9 = @daily&.sum(:equipqty9) || 0
    @daily_equim10 = @daily&.sum(:equipqty10) || 0
    @daily_equim11 = @daily&.sum(:equipqty11) || 0
    @daily_equim12 = @daily&.sum(:equipqty12) || 0
  end

  def daily_load
    # Definir los conjuntos de sufijos de columnas
    column_suffixes = %w[manqty omanqty smanqty dmanqty]
    hour_column_suffixes = %w[hour ohour shour dhour]

    # Iterar a través de los números del 5 al 12
    (1..12).each do |num|
      # Inicializar las variables de suma para este conjunto
      summan = 0
      sumhours = 0
      qtydays = 0

      # Iterar a través de los sufijos de columnas
      column_suffixes.each do |suffix|
        summan += @daily.sum("#{suffix}#{num}")
      end

      # Iterar a través de los sufijos de columnas de horas
      hour_column_suffixes.each do |suffix|
        sumhours += @daily.sum("#{suffix}#{num}")
      end

      # Iterar a través de los sufijos de columnas de horas
      column_suffixes.each do |suffix|
        qtydays += @daily.where("#{suffix}#{num} != 0").count
      end

      # Asignar las sumas calculadas a las variables correspondientes
      instance_variable_set("@summan#{num}", summan)
      instance_variable_set("@sumhours#{num}", sumhours)
      instance_variable_set("@qtydays#{num}", qtydays)
    end

    (1..12).each do |num|
      manqty_value = @daily.maximum("manqty#{num}") || 0
      omanqty_value = @daily.maximum("omanqty#{num}") || 0
      smanqty_value = @daily.maximum("smanqty#{num}") || 0
      dmanqty_value = @daily.maximum("dmanqty#{num}") || 0

      instance_variable_set("@max#{num}", manqty_value + omanqty_value + smanqty_value + dmanqty_value)
    end
  end
end
