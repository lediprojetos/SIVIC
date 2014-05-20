class SivicRelatorioscelulasController < ApplicationController
  before_action :set_sivic_relatorioscelula, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def jobCelulas
    if params[:NUMR_Dia] != nil

      
      SivicRelatorioscelula.update_all( "sivic_situacoesrelatorio_id = 4"," sivic_situacoesrelatorio_id = 5")


      @celulas = SivicCelula.where(:NUMR_Dia => params[:NUMR_Dia])

      @celulas.each do |sivic_celula|

        SivicRelatorioscelula.create(:sivic_celula_id => sivic_celula.id, :DATA_Reuniao => Time.now, :sivic_situacoesrelatorio_id => 5)

      end

    else

      @celulas = SivicCelula.all
      
    end

  end


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

    if params[:sivic_situacoesrelatorio_id] == nil
      params[:sivic_situacoesrelatorio_id] = '0'
    end

    if params[:nome_pessoa] == nil
      params[:nome_pessoa] = '0'
    end

    if params[:sivic_situacoesrelatorio_id] != '0' && params[:nome_pessoa] != '0'
      if current_user.role == 'LIDER_DE_CELULAS'
        @sivic_relatorioscelulas = SivicRelatorioscelula.joins('INNER JOIN sivic_celulas sp on sivic_celula_id = sp.id  INNER JOIN sivic_pessoas p on sp.sivic_pessoa_id = p.id and p.id = ' + current_user.sivic_pessoa.id.to_s).where('p.nome_pessoa like ? and sivic_situacoesrelatorio_id ='+ params[:sivic_situacoesrelatorio_id], "#{params[:nome_pessoa]}%").paginate(:page => params[:page], :per_page => 10)
      else
        @sivic_relatorioscelulas = SivicRelatorioscelula.joins('INNER JOIN sivic_celulas sp on sivic_celula_id = sp.id  INNER JOIN sivic_pessoas p on sp.sivic_pessoa_id = p.id').where('p.nome_pessoa like ? and sivic_situacoesrelatorio_id ='+ params[:sivic_situacoesrelatorio_id], "#{params[:nome_pessoa]}%").paginate(:page => params[:page], :per_page => 10)
      end
    elsif params[:sivic_situacoesrelatorio_id] != '0'
      if current_user.role == 'LIDER_DE_CELULAS'
        @sivic_relatorioscelulas = SivicRelatorioscelula.joins('INNER JOIN sivic_celulas sp on sivic_celula_id = sp.id  INNER JOIN sivic_pessoas p on sp.sivic_pessoa_id = p.id and p.id = ' + current_user.sivic_pessoa.id.to_s).where('sivic_situacoesrelatorio_id = ' + params[:sivic_situacoesrelatorio_id] + 'and sivic_situacoesrelatorio_id ='+ params[:sivic_situacoesrelatorio_id]).paginate(:page => params[:page], :per_page => 10)
      else
        @sivic_relatorioscelulas = SivicRelatorioscelula.where(:sivic_situacoesrelatorio_id => params[:sivic_situacoesrelatorio_id]).paginate(:page => params[:page], :per_page => 10)
      end
    elsif params[:nome_pessoa] != '0'
      if current_user.role == 'LIDER_DE_CELULAS'
        @sivic_relatorioscelulas = SivicRelatorioscelula.joins('INNER JOIN sivic_celulas sp on sivic_celula_id = sp.id INNER JOIN sivic_pessoas p on sp.sivic_pessoa_id = p.id and p.id = ' + current_user.sivic_pessoa.id.to_s).where('p.nome_pessoa like ?', "#{params[:nome_pessoa]}%").paginate(:page => params[:page], :per_page => 10)
      else
        @sivic_relatorioscelulas = SivicRelatorioscelula.joins('INNER JOIN sivic_celulas sp on sivic_celula_id = sp.id INNER JOIN sivic_pessoas p on sp.sivic_pessoa_id = p.id').where('p.nome_pessoa like ?', "#{params[:nome_pessoa]}%").paginate(:page => params[:page], :per_page => 10)
      end
    elsif
      if current_user.role == 'LIDER_DE_CELULAS'
        @sivic_relatorioscelulas = SivicRelatorioscelula.joins('INNER JOIN sivic_celulas cel on sivic_celula_id = cel.id').where('cel.sivic_pessoa_id' => current_user.sivic_pessoa.id).paginate(:page => params[:page], :per_page => 10)
      else
        @sivic_relatorioscelulas = SivicRelatorioscelula.paginate(:page => params[:page], :per_page => 10)
      end
    end
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
    @sivic_Observacoesrelatorios = Observacoesrelatorio.where(:sivic_relatorioscelula_id => params[:id])
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
