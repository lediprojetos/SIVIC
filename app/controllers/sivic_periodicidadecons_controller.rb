class SivicPeriodicidadeconsController < ApplicationController
  before_action :set_sivic_periodicidadecon, only: [:show, :edit, :update, :destroy]

  # GET /sivic_periodicidadecons
  # GET /sivic_periodicidadecons.json
  def index
    @sivic_periodicidadecons = SivicPeriodicidadecon.all
  end

  # GET /sivic_periodicidadecons/1
  # GET /sivic_periodicidadecons/1.json
  def show
  end

  # GET /sivic_periodicidadecons/new
  def new
    @sivic_periodicidadecon = SivicPeriodicidadecon.new
  end

  # GET /sivic_periodicidadecons/1/edit
  def edit
  end

  # POST /sivic_periodicidadecons
  # POST /sivic_periodicidadecons.json
  def create
    @sivic_periodicidadecon = SivicPeriodicidadecon.new(sivic_periodicidadecon_params)

    respond_to do |format|
      if @sivic_periodicidadecon.save
        format.html { redirect_to @sivic_periodicidadecon, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_periodicidadecon }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_periodicidadecon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_periodicidadecons/1
  # PATCH/PUT /sivic_periodicidadecons/1.json
  def update
    respond_to do |format|
      if @sivic_periodicidadecon.update(sivic_periodicidadecon_params)
        format.html { redirect_to @sivic_periodicidadecon, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_periodicidadecon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_periodicidadecons/1
  # DELETE /sivic_periodicidadecons/1.json
  def destroy
    @sivic_periodicidadecon.destroy
    respond_to do |format|
      format.html { redirect_to sivic_periodicidadecons_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_periodicidadecon
      @sivic_periodicidadecon = SivicPeriodicidadecon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_periodicidadecon_params
      params.require(:sivic_periodicidadecon).permit(:desc_periodicidade, :numr_qtddia, :sivic_igreja_id)
    end
end
