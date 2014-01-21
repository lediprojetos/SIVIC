class SivicMovimentofinanceirosController < ApplicationController
  before_action :set_sivic_movimentofinanceiro, only: [:show, :edit, :update, :destroy]

  # GET /sivic_movimentofinanceiros
  # GET /sivic_movimentofinanceiros.json
  def index
    @sivic_movimentofinanceiros = SivicMovimentofinanceiro.all
  end

  # GET /sivic_movimentofinanceiros/1
  # GET /sivic_movimentofinanceiros/1.json
  def show
  end

  # GET /sivic_movimentofinanceiros/new
  def new
    @sivic_movimentofinanceiro = SivicMovimentofinanceiro.new
  end

  # GET /sivic_movimentofinanceiros/1/edit
  def edit
  end

  # POST /sivic_movimentofinanceiros
  # POST /sivic_movimentofinanceiros.json
  def create
    @sivic_movimentofinanceiro = SivicMovimentofinanceiro.new(sivic_movimentofinanceiro_params)

    respond_to do |format|
      if @sivic_movimentofinanceiro.save
        format.html { redirect_to @sivic_movimentofinanceiro, notice: 'Sivic movimentofinanceiro was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_movimentofinanceiro }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_movimentofinanceiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_movimentofinanceiros/1
  # PATCH/PUT /sivic_movimentofinanceiros/1.json
  def update
    respond_to do |format|
      if @sivic_movimentofinanceiro.update(sivic_movimentofinanceiro_params)
        format.html { redirect_to @sivic_movimentofinanceiro, notice: 'Sivic movimentofinanceiro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_movimentofinanceiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_movimentofinanceiros/1
  # DELETE /sivic_movimentofinanceiros/1.json
  def destroy
    @sivic_movimentofinanceiro.destroy
    respond_to do |format|
      format.html { redirect_to sivic_movimentofinanceiros_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_movimentofinanceiro
      @sivic_movimentofinanceiro = SivicMovimentofinanceiro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_movimentofinanceiro_params
      params.require(:sivic_movimentofinanceiro).permit(:VALR_movimento, :User_id, :DATA_exclusao, :FLAG_baixa, :User_id, :sivic_tipmovfinanceiro_id, :sivic_evento_id)
    end
end
