class SivicDiscipulosController < ApplicationController
  before_action :set_sivic_discipulo, only: [:show, :edit, :update, :destroy]

  # GET /sivic_discipulos
  # GET /sivic_discipulos.json
  def index
    @sivic_discipulos = SivicDiscipulo.all
  end

  # GET /sivic_discipulos/1
  # GET /sivic_discipulos/1.json
  def show
  end

  # GET /sivic_discipulos/new
  def new
    @sivic_discipulo = SivicDiscipulo.new
  end

  # GET /sivic_discipulos/1/edit
  def edit
  end

  # POST /sivic_discipulos
  # POST /sivic_discipulos.json
  def create
    @sivic_discipulo = SivicDiscipulo.new(sivic_discipulo_params)

    respond_to do |format|
      if @sivic_discipulo.save
        format.html { redirect_to @sivic_discipulo, notice: 'Sivic discipulo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_discipulo }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_discipulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_discipulos/1
  # PATCH/PUT /sivic_discipulos/1.json
  def update
    respond_to do |format|
      if @sivic_discipulo.update(sivic_discipulo_params)
        format.html { redirect_to @sivic_discipulo, notice: 'Sivic discipulo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_discipulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_discipulos/1
  # DELETE /sivic_discipulos/1.json
  def destroy
    @sivic_discipulo.destroy
    respond_to do |format|
      format.html { redirect_to sivic_discipulos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_discipulo
      @sivic_discipulo = SivicDiscipulo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_discipulo_params
      params.require(:sivic_discipulo).permit(:sivic_pessoa_id, :sivic_endereco_id, :sivic_profissao_id, :sivic_escolaridade_id, :sivic_rede_id, :sivic_celula_id, :NUMG_ProfissaoConjuge, :NUMG_UsuarioInclusao, :NUMG_UsuarioBloqueio, :DESC_Sexo, :DATA_Nascimento, :DESC_Apelido, :DESC_EstadoCivil, :NOME_Conjuge, :DATA_Decisao, :NUMR_QtdFilhos, :FLAG_Membro, :FLAG_RecebeuCristo, :FLAG_Reconciliacao, :FLAG_OcasiaoCelula, :FLAG_OcasiaoCelebracaoEvento, :FLAG_OcasiaoEvangelismoPessoal, :FLAG_OcasiaoCultoLivre, :FLAG_Trabalhando, :DESC_MomentoEstudoBiblico, :NUMR_RG, :DATA_EmissaoRG, :NUMR_CPF, :NOME_Pai, :NOME_Mae, :DATA_NascConjuge, :DATA_Casamento, :NUMR_TituloEleitoral, :DATA_Batismo, :DESC_IgrejaBatismo, :FLAG_DoadorSangue, :FLAG_DoadorOrgao)
    end
end