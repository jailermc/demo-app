class FillFormulasController < ApplicationController
  before_action :set_fill_formula, only: [:show, :edit, :update, :destroy]

  # GET /fill_formulas
  def index
    @fill_formulas = FillFormula.all
  end

  # GET /fill_formulas/1
  def show
  end

  # GET /fill_formulas/new
  def new
    @fill_formula = FillFormula.new
  end

  # GET /fill_formulas/1/edit
  def edit
  end

  # POST /fill_formulas
  def create
    @fill_formula = FillFormula.new(fill_formula_params)

    if @fill_formula.save
      redirect_to @fill_formula, notice: 'Fill formula was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /fill_formulas/1
  def update
    if @fill_formula.update(fill_formula_params)
      redirect_to @fill_formula, notice: 'Fill formula was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /fill_formulas/1
  def destroy
    @fill_formula.destroy
    redirect_to fill_formulas_url, notice: 'Fill formula was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fill_formula
      @fill_formula = FillFormula.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fill_formula_params
      params.fetch(:fill_formula, {})
    end
end
