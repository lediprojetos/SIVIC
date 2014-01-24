class SivicParticipantecelulasController < ApplicationController
  before_action :set_sivic_participantecelula, only: [:show, :edit, :update, :destroy]

  # GET /sivic_participantecelulas
  # GET /sivic_participantecelulas.json
  def index
    @sivic_participantecelulas = SivicParticipantecelula.all
  end

  # GET /sivic_participantecelulas/1
  # GET /sivic_participantecelulas/1.json
  def show
  end

  # GET /sivic_participantecelulas/new
  def new
    @sivic_participantecelula = SivicParticipantecelula.new
  end

  # GET /sivic_participantecelulas/1/edit
  def edit
  end

  # POST /sivic_participantecelulas
  # POST /sivic_participantecelulas.json
  def create
    @sivic_participantecelula = SivicParticipantecelula.new(sivic_participantecelula_params)

    respond_to do |format|
      if @sivic_participantecelula.save
        format.html { redirect_to @sivic_participantecelula, notice: 'Sivic participantecelula was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_participantecelula }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_participantecelula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_participantecelulas/1
  # PATCH/PUT /sivic_participantecelulas/1.json
  def update
    respond_to do |format|
      if @sivic_participantecelula.update(sivic_participantecelula_params)
        format.html { redirect_to @sivic_participantecelula, notice: 'Sivic participantecelula was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_participantecelula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_participantecelulas/1
  # DELETE /sivic_participantecelulas/1.json
  def destroy
    @sivic_participantecelula.destroy
    respond_to do |format|
      format.html { redirect_to sivic_participantecelulas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_participantecelula
      @sivic_participantecelula = SivicParticipantecelula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_participantecelula_params
      params.require(:sivic_participantecelula).permit(:NOME_Participante, :DESC_Email, :NUMR_Telefone, :DESC_SituacaoParticipante)
    end
end
