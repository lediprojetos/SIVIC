class SivicRelatorioscelulasController < ApplicationController
  before_action :set_sivic_relatorioscelula, only: [:show, :edit, :update, :destroy]


  def altera_situacao
    #sivic_relatorio = SivicRelatorioscelula.where(:id => params[:id])
    #sivic_relatorio.update(:sivic_situacoesrelatorio_id => params[:sivic_situacoesrelatorio_id])

    sivic_evento = SivicRelatorioscelula.find_by_id(params[:sivic_relatorioscelula_id])
    sivic_evento.sivic_situacoesrelatorio_id = params[:sivic_situacoesrelatorio_id]
    sivic_evento.save

    respond_to do |format|
    format.html { redirect_to sivic_relatorioscelulas_path }
    format.json { head :no_content }
    end    

  end


  # GET /sivic_relatorioscelulas
  # GET /sivic_relatorioscelulas.json
  def index
    @sivic_relatorioscelulas = SivicRelatorioscelula.all
  end

  # GET /sivic_relatorioscelulas/1
  # GET /sivic_relatorioscelulas/1.json
  def show
    @sivic_partevenrelacelulas = SivicParticipantecelula.all

    @sivic_Observacoesrelatorios = Observacoesrelatorio.where(:sivic_relatorioscelula_id => params[:id])
  end

  # GET /sivic_relatorioscelulas/new
  def new
    @sivic_relatorioscelula = SivicRelatorioscelula.new
  end

  # GET /sivic_relatorioscelulas/1/edit
  def edit
  end

  # POST /sivic_relatorioscelulas
  # POST /sivic_relatorioscelulas.json
  def create
    @sivic_relatorioscelula = SivicRelatorioscelula.new(sivic_relatorioscelula_params)

    respond_to do |format|
      if @sivic_relatorioscelula.save
        format.html { redirect_to @sivic_relatorioscelula, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_relatorioscelula }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_relatorioscelula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_relatorioscelulas/1
  # PATCH/PUT /sivic_relatorioscelulas/1.json
  def update
    respond_to do |format|
      if @sivic_relatorioscelula.update(sivic_relatorioscelula_params)
        format.html { redirect_to @sivic_relatorioscelula, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_relatorioscelula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_relatorioscelulas/1
  # DELETE /sivic_relatorioscelulas/1.json
  def destroy
    @sivic_relatorioscelula.destroy
    respond_to do |format|
      format.html { redirect_to sivic_relatorioscelulas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_relatorioscelula
      @sivic_relatorioscelula = SivicRelatorioscelula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_relatorioscelula_params
      params.require(:sivic_relatorioscelula).permit(:sivic_celula_id, :DATA_Reuniao, :DATA_Horainicio, :DATA_HoraTermino, :NUMR_NumVisitante, :NUMR_NumParticipante, :DESC_AssuntoEstudo, :DESC_TextoBiblico, :VALR_Oferta, :NUMR_Decisoes, :DESC_OutrasInformacoes, :sivic_situacoesrelatorio_id, :NUMR_QtdNovoConvertido, :NUMR_QtdResgate, :NUMR_QtdPreEncontro, :NUMR_QtdEncontro, :NUMR_QtdPosEncontro, :NUMR_QtdEscoLid1, :NUMR_EscoLid2, :NUMR_EscoLid3, :NUMR_QtdLidCelula)
    end
end
