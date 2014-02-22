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

   def create
    @sivic_relatorioscelula = SivicRelatorioscelula.find(params[:sivic_relatorioscelula_id])
    @sivic_partevenrelacelula = @sivic_relatorioscelula.sivic_partevenrelacelula.create(sivic_partevenrelacelula_params)
    redirect_to sivic_relatorioscelula_path(@sivic_relatorioscelula)
   end

  def create_participante

      debugger

      sivic_relatorioparticipante = SivicPartevenrelacelula.find :all, :conditions => {:sivic_relatorioscelula_id => params[:sivic_relatorioscelula_id],:sivic_participantecelula_id => params[:sivic_participantecelula_id]}
      
      if sivic_relatorioparticipante.empty?
        SivicPartevenrelacelula.create(:sivic_relatorioscelula_id => params[:sivic_relatorioscelula_id],:sivic_participantecelula_id => params[:sivic_participantecelula_id],:DESC_SituacaoParticipante => params[:DESC_SituacaoParticipante], :sivic_sitpartcelula_id => params[:sivic_sitpartcelula_id])
        sivic_relatorioparticipante = SivicPartevenrelacelula.find :all, :conditions => {:sivic_relatorioscelula_id => params[:sivic_relatorioscelula_id],:sivic_participantecelula_id => params[:sivic_participantecelula_id]}
        sivic_relatorioparticipante_json = sivic_relatorioparticipante.map {|item| {:id => item.id, :NOME_Participante => item.sivic_participantecelula.NOME_Participante, :DESC_Email => item.sivic_participantecelula.DESC_Email, :NUMR_Telefone => item.sivic_participantecelula.NUMR_Telefone, :DESC_SituacaoParticipante => item.sivic_relatorioparticipante.sivic_sitpartcelula.DESC_Situacao}}
        render :json => sivic_relatorioparticipante_json
      end

  end   



   def destroy
    @sivic_relatorioscelula = SivicRelatorioscelula.find(params[:sivic_relatorioscelula_id])
    @sivic_partevenrelacelula = @sivic_relatorioscelula.sivic_partevenrelacelula.find(params[:id])
    @sivic_partevenrelacelula.destroy
    redirect_to sivic_relatorioscelula_path(@sivic_relatorioscelula)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_partevenrelacelula
      @sivic_partevenrelacelula = SivicPartevenrelacelula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_partevenrelacelula_params
      params.require(:sivic_partevenrelacelula).permit(:sivic_relatorioscelula_id, :sivic_participantecelula_id, :DESC_SituacaoParticipante)
    end
end

