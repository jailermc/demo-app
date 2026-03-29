class EstimatedsController < ApplicationController
  before_action :set_estimated, only: %i[show edit update destroy]

  # GET /estimateds
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
      # Mostrar registros del presente mes si no se selecciona año ni mes
      start_date = Time.zone.now.beginning_of_month
      end_date = Time.zone.now.end_of_month
    end

    @estimateds = Estimated.search(params[:searchbox]).where(created_at: start_date..end_date).order(created_at: :desc)
    @estimateds_count = @estimateds.count

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @selector = []
    (1..12).each do |i|
      alabor = "alabor#{i}"
      esti = case @estimated.send(alabor)
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
      @selector << esti
    end
  end

  # GET /estimateds/new
  def new
    @estimated = Estimated.new
    @over1 = @estimated.over1
  end

  # GET /estimateds/1/edit
  def edit
    @equip = @estimated.eexcavator1
    @equip2 = @estimated.eexcavator1
    @equip3 = @estimated.scisso3
    @equip4 = @estimated.loader4
    @equip5 = @estimated.etrunck5
    @equip6 = @estimated.ebobcat6
    @porce = @estimated.profitporcen
    @subporce1 = @estimated.subporce1
    @subporce2 = @estimated.subporce2
    @subporce3 = @estimated.subporce3
    @sf = @estimated.sf
    @over1 = @estimated.over1
    @over2 = @estimated.over2
    @over3 = @estimated.over3
    @over4 = @estimated.over4
    @over5 = @estimated.over5
    @over6 = @estimated.over6
    @over7 = @estimated.over7
    @over8 = @estimated.over8
    @over9 = @estimated.over9
    @over10 = @estimated.over10
    @over11 = @estimated.over11
    @over12 = @estimated.over12
  end

  # POST /estimateds
  def create
    @estimated = Estimated.new(estimated_params)
    @estimated.user = current_user.email
    if @estimated.save
      redirect_to @estimated, notice: 'Estimated was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /estimateds/1
  def update
    if @estimated.update(estimated_params)
      redirect_to @estimated, notice: 'Estimated was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /estimateds/1
  def destroy
    @estimated.destroy
    redirect_to estimateds_url, notice: 'Estimated was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_estimated
    @estimated = Estimated.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def estimated_params
    params.require(:estimated).permit(:mov_pdescription3, :mov_pqty3, :mov_pricing3, :mov_total3, :totalfuel, :eresult1, :eresult2, :eresult3, :eresult4, :eresult5, :eresult6, :eresult12, :eresult7, :eresult8, :eresult9, :eresult10, :eresult11, :mdescription32, :mqtysfft32, :mpricing32, :mtotal32, :mdescription31, :mqtysfft31, :mpricing31, :mtotal31, :ec_description3, :ec_qty3, :ec_pricing3, :ec_total3, :ec_description4, :ec_qty4, :ec_pricing4, :ec_total4, :ec_description5, :ec_qty5, :ec_pricing5, :ec_total5, :ec_total, :tf_total, :mov_pdescription2, :mov_pqty2, :mov_pricing2, :mov_total2, :per_total, :fuel1, :fdescription1, :fqtysflf1, :fdays1, :fpricing1, :ftotal1, :check_box_s, :ftotal, :pdescription8, :pqty8, :ppricing8, :ptotal8, :mdescription18, :mqtysfft18, :mpricing18, :mtotal18, :subporce1, :subporce2, :subdefault3, :subdescription3, :subqtysfft3, :subpricing3, :subporce3, :subtotal3, :mdescription17, :mqtysfft17, :mpricing17, :mtotal17, :mdescription16, :mqtysfft16, :mpricing16, :mtotal16, :pdescription7, :pqty7, :ppricing7, :ptotal7, :subdefault1, :subdescription1, :subqtysfft1, :subpricing1, :subtotal1, :subdefault2, :subdescription2, :subqtysfft2, :subpricing2, :subtotal2, :subtotaltotal, :tdescription6, :tqtyyds6, :tpricing6, :ttotal6, :tdescription5, :tqtysfft5, :tpricing5, :ttotal5, :alabor11, :alabor12, :alabor10, :adescription10, :aemp10, :adays10, :ahours10, :over10, :apricing10, :atotal10, :adescription11, :aemp11, :adays11, :ahours11, :over11, :apricing11, :atotal11, :adescription12, :aemp12, :adays12, :ahours12, :over12, :apricing12, :atotal12, :edefault9, :edescription9, :eqty9, :edaywk9, :epricing9, :etotal9, :edefault10, :edescription10, :eqty10, :edaywk10, :epricing10, :etotal10, :edefault11, :edescription11, :eqty11, :edaywk11, :epricing11, :etotal11, :edefault12, :edescription12, :eqty12, :edaywk12, :epricing12, :etotal12, :user, :totalsalvage, :mdescription12, :mqtysfft12, :mpricing12, :mtotal12, :mdescription13, :mqtysfft13, :mpricing13, :mtotal13, :mdescription14, :mqtysfft14, :mpricing14, :mtotal14, :mdescription15, :mqtysfft15, :mpricing15, :mtotal15, :over1, :over2, :over3, :over4, :over5, :over6, :over7, :over8, :over9, :ahours1, :ahours2, :ahours3, :ahours4, :ahours5, :ahours6, :ahours7, :ahours8, :ahours9, :stotal2, :saw2, :sdescription2, :sqtysflf2, :sdays2, :spricing2, :stotal3, :saw3, :sdescription3, :sqtysflf3, :sdays3, :spricing3, :saw1, :mdescription9, :mqtysfft9, :mdays9, :mpricing9, :mtotal9, :mdescription11, :mqtysfft11, :mdays11, :mpricing11, :mtotal11, :address, :salvage,
                                      :name, :date1, :status, :date, :alabor1, :adescription1, :adays1, :aemp1, :apricing1, :atotal1, :alabor2, :adescription2, :adays2, :aemp2, :apricing2, :atotal2, :alabor3, :adescriptio3, :adays3, :aemp3, :apricing3, :atotal3, :alabor4, :adescription4, :adays4, :aemp4, :apricing4, :atotal4, :alabor5, :adescription5, :adays5, :aemp5, :apricing5, :atotal5, :alabor6, :adescription6, :adays6, :aemp6, :apricing6, :atotal6, :alabor7, :adescription7, :adays7, :aemp7, :apricing7, :atotal7, :alabor8, :adescription8, :adays8, :aemp8, :apricing8, :atotal8, :alabor9, :adescription9, :adays9, :aemp9, :apricing9, :atotal9, :eexcavator1, :edescription1, :eqty1, :edaywk1, :epricing1, :etotal1, :eexcavator2, :edescription2, :eqty2, :edaywk2, :epricing2, :etotal2, :scisso3, :edescription3, :eqty3, :edaywk3, :epricing3, :etotal3, :loader4, :edescription4, :eqty4, :edaywk4, :epricing4, :etotal4, :etrunck5, :edescription5, :eqty5, :edaywk5, :epricing5, :etotal5, :ebobcat6, :edescription6, :eqty6, :edaywk6, :epricing6, :etotal6, :etotal, :edefault7, :edescription7, :eqty7, :edaywk7, :epricing7, :etotal7, :edefault8, :edescription8, :eqty8, :edaywk8, :epricing8, :etotal8, :ttrash1, :tdescription1, :tqtyyds1, :tdays1, :tpricing1, :tconcrete2, :tdescription2, :tqtyyds2, :tdays2, :tpricing2, :tasphalt3, :tdescription3, :tqtyyds3, :tdays3, :tpricing3, :ttotal, :pdemo1, :pdescription1, :pqty1, :pdays1, :ppricing1, :pplumbing2, :pdescription2, :pqty2, :pdays2, :ppricing2, :pelectical3, :pdescription3, :pqty3, :pdays3, :ppricing3, :pderm4, :pdescription4, :pqty4, :pdays4, :ppricing4, :ptree5, :pdescription5, :pqty5, :pdays5, :ppricing5, :pmechanical6, :pdescription6, :pqty6, :pdays6, :ppricing6, :ptotal, :mmiscellaneous1, :mdescription1, :mqtysfft1, :mdays1, :mpricing1, :mdefault2, :mdescription2, :mqtysfft2, :mdays2, :mpricing2, :mdefault3, :mdescription3, :mqtysfft3, :mdays3, :mpricing3, :mtotal, :subtotal, :profit, :total, :sf, :persf, :adescriptio3, :tdescription4, :tqtyyds4, :tdays4, :tpricing4, :mdefault4, :mdescription4, :mqtysfft4, :mdays4, :mpricing4, :mdefault5, :mdescription5, :mqtysfft5, :mdays5, :mpricing5, :sdescription1, :sqtysflf1, :sdays1, :spricing1, :mdefault6, :mdescription6, :mqtysfft6, :mdays6, :mpricing6, :mdefault7, :mdescription7, :mqtysfft7, :mdays7, :mpricing7, :mdefault8, :mdescription8, :mqtysfft8, :mdays8, :mpricing8, :atotal, :stotal1, :stotal, :ttotal1, :ttotal2, :ttotal3, :ttotal4, :ptotal1, :ptotal2, :ptotal3, :ptotal4, :ptotal5, :ptotal6, :mtotal1, :mtotal2, :mtotal3, :mtotal4, :mtotal5, :mtotal6, :mtotal7, :mtotal8, :pptotal, :profitporcen)
  end
end
