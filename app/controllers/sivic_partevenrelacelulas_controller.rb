class SivicPartevenrelacelulasController < ApplicationController
  before_action :set_sivic_partevenrelacelula, only: [:show, :edit, :update, :destroy]

  # GET /sivic_partevenrelacelulas
  # GET /sivic_partevenrelacelulas.json
  def index
    @sivic_partevenrelacelulas = SivicPartevenrelacelula.all
  end

  # GET /sivic_partevenrelacelulas/1
  # GET /sivic_partevenrelacelulas/1.json
  def show
  end

  # GET /sivic_partevenrelacelulas/new
  def new
    @sivic_partevenrelacelula = SivicPartevenrelacelula.new
  end

  # GET /sivic_partevenrelacelulas/1/edit
  def edit
  end

  # POST /sivic_partevenrelacelulas
  # POST /sivic_partevenrelacelulas.json
  def create
    @sivic_partevenrelacelula = SivicPartevenrelacelula.new(sivic_partevenrelacelula_params)

    respond_to do |format|
      if @sivic_partevenrelacelula.save
        format.html { redirect_to @sivic_partevenrelacelula, notice: 'Sivic partevenrelacelula was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_partevenrelacelula }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_partevenrelacelula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_partevenrelacelulas/1
  # PATCH/PUT /sivic_partevenrelacelulas/1.json
  def update
    respond_to do |format|
      if @sivic_partevenrelacelula.update(sivic_partevenrelacelula_params)
        format.html { redirect_to @sivic_partevenrelacelula, notice: 'Sivic partevenrelacelula was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_partevenrelacelula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_partevenrelacelulas/1
  # DELETE /sivic_partevenrelacelulas/1.json
  def destroy
    @sivic_partevenrelacelula.destroy
    respond_to do |format|
      format.html { redirect_to sivic_partevenrelacelulas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_partevenrelacelula
      @sivic_partevenrelacelula = SivicPartevenrelacelula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_partevenrelacelula_params
      params.require(:sivic_partevenrelacelula).permit(:sivic_relatorioscelula, :_id, :sivic_participantecelula_id, :DESC_SituacaoParticipante)
    end
end
