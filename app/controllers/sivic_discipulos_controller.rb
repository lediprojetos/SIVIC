class SivicDiscipulosController < ApplicationController
  before_action :set_sivic_discipulo, only: [:show, :edit, :update, :destroy, :relDiscipulos]

  def relDiscipulos
    @sivic_discipulo = SivicDiscipulo.find(params[:id])
    @tipo_relatorio = params[:tipo]
  end

  def relGeracoes
    @sivic_discipulo = SivicDiscipulo.find(params[:id])
    @tipo_relatorio = params[:tipo]
  end  

  def relDiscipulos2
    
    
  end  

  # GET /sivic_discipulos
  # GET /sivic_discipulos.json
  def index
    @sivic_discipulos = SivicDiscipulo.find_by_name_or_all(params[:q]).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /sivic_discipulos/1
  # GET /sivic_discipulos/1.json
  def show
  end

  # GET /sivic_discipulos/new
  def new
    @sivic_discipulo = SivicDiscipulo.new
    @sivic_discipulo.build_sivic_pessoa
    @sivic_discipulo.build_sivic_endereco
  end

  # GET /sivic_discipulos/1/edit
  def edit

    @sivic_estado = SivicDiscipulo.find(params[:id])
    @sivic_estado = @sivic_estado.sivic_endereco.sivic_cidade.sivic_estado.id

    @sivic_cidade = SivicCidade.find :all, :conditions => {:sivic_estado_id => @sivic_estado}

    @sivic_cidade_setada = SivicDiscipulo.find(params[:id])
    @sivic_cidade_setada = @sivic_cidade_setada.sivic_endereco.sivic_cidade.id

  end

  # POST /sivic_discipulos
  # POST /sivic_discipulos.json
  def create

    pessoa = SivicPessoa.find params[:sivic_discipulo][:sivic_pessoa_id] rescue nil

    if pessoa
      @sivic_discipulo = SivicDiscipulo.new(sivic_discipulo_params_normal)
      @sivic_discipulo.sivic_pessoa = pessoa
    else
      @sivic_discipulo = SivicDiscipulo.new(sivic_discipulo_params_netested)      
    end
      
   #codigo = geracodigo(@sivic_discipulo.sivic_pessoa.sivic_igreja_id)
   #@sivic_discipulo.NUMR_Codigo = codigo 
   
   respond_to do |format|

      if @sivic_discipulo.save
      
        format.html { redirect_to @sivic_discipulo, notice: 'Registro inserido com sucesso.' }
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
      if @sivic_discipulo.update(sivic_discipulo_params_netested)
        format.html { redirect_to @sivic_discipulo, notice: 'Registro alterado com sucesso.' }
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
    def sivic_discipulo_params_netested
      params.require(:sivic_discipulo).permit( :sivic_profissao_id, :DESC_TelefoneFixo, :DESC_TelefoneCelular, :sivic_escolaridade_id, :sivic_rede_id, :sivic_celula_id, :NUMG_ProfissaoConjuge, :NUMG_UsuarioInclusao, :NUMG_UsuarioBloqueio, :DESC_Sexo, :DATA_Nascimento, :DESC_Apelido, :DESC_EstadoCivil, :NOME_Conjuge, :DATA_Decisao, :NUMR_QtdFilhos, :FLAG_Membro, :FLAG_RecebeuCristo, :FLAG_Reconciliacao, :FLAG_OcasiaoCelula, :FLAG_OcasiaoCelebracaoEvento, :FLAG_OcasiaoEvangelismoPessoal, :FLAG_OcasiaoCultoLivre, :FLAG_Trabalhando, :DESC_MomentoEstudoBiblico, :NUMR_RG, :DATA_EmissaoRG, :NUMR_CPF, :NOME_Pai, :NOME_Mae, :DATA_NascConjuge, :DATA_Casamento, :NUMR_TituloEleitoral, :DATA_Batismo, :DESC_IgrejaBatismo, :FLAG_DoadorSangue, :FLAG_DoadorOrgao, :NUMR_Codigo, sivic_pessoa_attributes: [:id, :NOME_pessoa, :DESC_email, :DESC_observacao, :User_id, :sivic_igreja_id, :father_id], sivic_endereco_attributes: [ :id, :DESC_Bairro, :DESC_Rua, :DESC_Complemento, :DESC_Pontoreferencia, :NUMR_Cep, :sivic_cidade_id])
    end

    def sivic_discipulo_params_normal
      params.require(:sivic_discipulo).permit(:sivic_pessoa_id, :DESC_TelefoneFixo, :DESC_TelefoneCelular, :sivic_profissao_id, :sivic_escolaridade_id, :sivic_rede_id, :sivic_celula_id, :NUMG_ProfissaoConjuge, :NUMG_UsuarioInclusao, :NUMG_UsuarioBloqueio, :DESC_Sexo, :DATA_Nascimento, :DESC_Apelido, :DESC_EstadoCivil, :NOME_Conjuge, :DATA_Decisao, :NUMR_QtdFilhos, :FLAG_Membro, :FLAG_RecebeuCristo, :FLAG_Reconciliacao, :FLAG_OcasiaoCelula, :FLAG_OcasiaoCelebracaoEvento, :FLAG_OcasiaoEvangelismoPessoal, :FLAG_OcasiaoCultoLivre, :FLAG_Trabalhando, :DESC_MomentoEstudoBiblico, :NUMR_RG, :DATA_EmissaoRG, :NUMR_CPF, :NOME_Pai, :NOME_Mae, :DATA_NascConjuge, :DATA_Casamento, :NUMR_TituloEleitoral, :DATA_Batismo, :DESC_IgrejaBatismo, :FLAG_DoadorSangue, :FLAG_DoadorOrgao, :NUMR_Codigo, sivic_endereco_attributes: [ :id, :DESC_Bairro, :DESC_Rua, :DESC_Complemento, :DESC_Pontoreferencia, :NUMR_Cep, :sivic_cidade_id ])
    end    
end
