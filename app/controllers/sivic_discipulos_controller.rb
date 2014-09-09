class SivicDiscipulosController < ApplicationController
  before_action :set_sivic_discipulo, only: [:show, :edit, :update, :destroy, :relDiscipulos]
  before_action :authenticate_user!


  def relDiscipulos
    @sivic_discipulo = SivicDiscipulo.find(params[:id])
    @tipo_relatorio = params[:tipo]
  end

  def relGeracoes
    @sivic_discipulo = SivicDiscipulo.find(params[:id])
    @tipo_relatorio = params[:tipo]

    @allperson = [@sivic_discipulo.sivic_pessoa_id]
    BuscaPessoas2(@sivic_discipulo.sivic_pessoa_id)

    respond_to do |format|
      format.html
      format.pdf { render_civic_discipulo_geracao_list(@allperson) }
    end

  end



def BuscaPessoas2(id)
  sivic_dados = SivicDiscipulo.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id where father_id = ' + id.to_s)

  if sivic_dados

    sivic_dados.each do |sivic_dados|

      #debugger
      @allperson += [sivic_dados.sivic_pessoa.id]
      @allperson += BuscaPessoas2(sivic_dados.sivic_pessoa.id)

    end

  end
end

def render_civic_discipulo_geracao_list(tasks)
  report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'discipulos_geracao.tlf')

  for n in tasks
    dados_pessoa = SivicDiscipulo.find_by_sivic_pessoa_id(n) rescue nil

    if dados_pessoa
      report.list.add_row do |row|
        row.values lblId: dados_pessoa.sivic_pessoa_id
        row.values lblNome: dados_pessoa.sivic_pessoa.nome_pessoa
        row.values lblNascimento: dados_pessoa.DATA_Nascimento
        row.values lblEndereco: dados_pessoa.sivic_endereco.DESC_Rua + ' ' + dados_pessoa.sivic_endereco.DESC_Complemento + ' ' + dados_pessoa.sivic_endereco.NUMR_Cep
        row.values lblBairro: dados_pessoa.sivic_endereco.DESC_Bairro
        row.values lblCelular: dados_pessoa.DESC_TelefoneCelular
        row.values lblTelefone: dados_pessoa.DESC_TelefoneCelular
      end
    end
  end


  report.page.item(:data).value(Time.now)
  report.page.item(:operador).value(current_user.sivic_pessoa.nome_pessoa)
  
  send_data report.generate, filename: 'discipulos_geracao.pdf', 
                             type: 'application/pdf', 
                             disposition: ''
end



  def busca_discipulos

    sivic_discipulo = SivicPessoa.joins('LEFT JOIN sivic_discipulos sp on sp.sivic_pessoa_id = sivic_pessoas.id').where('lower(nome_pessoa) like ? and sivic_igreja_id = ?', "%#{params[:nome_pessoa].downcase}%", current_user.sivic_pessoa.sivic_igreja_id).last(10)

    sivic_pessoa_json = sivic_discipulo.map {|item| {:id_discipulo => SivicDiscipulo.find_by_sivic_pessoa_id(item.id).nil? ? '' : SivicDiscipulo.find_by_sivic_pessoa_id(item.id).id ,:id => item.id, :nome_pessoa => item.nome_pessoa, :DESC_email => item.DESC_email, :father_id => item.father_id,:NOME_Lider => item.father.blank? ? '' : item.father.nome_pessoa}}
    render :json => sivic_pessoa_json
  end  


  # GET /sivic_discipulos
  # GET /sivic_discipulos.json
  def index
    @sivic_discipulos = SivicDiscipulo.find_by_name_or_all(params[:q],current_user.sivic_pessoa.sivic_igreja_id).paginate(:page => params[:page], :per_page => 10)
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

    @sivic_cidade2 = SivicCidade.find :all, :conditions => {:sivic_estado_id => SivicDiscipulo.find(params[:id]).sivic_cidade.sivic_estado.id} rescue nil
    @sivic_estado2 = SivicDiscipulo.find(params[:id]).sivic_cidade.sivic_estado.id rescue nil

    @sivic_naturalidade_setada = SivicDiscipulo.find(params[:id])
    @sivic_naturalidade_setada = @sivic_naturalidade_setada.sivic_cidade.id rescue nil

  end

  # POST /sivic_discipulos
  # POST /sivic_discipulos.json
  def create

    pessoa = SivicPessoa.find params[:sivic_discipulo][:sivic_pessoa_id] rescue nil

    if pessoa
      @sivic_discipulo = SivicDiscipulo.new(sivic_discipulo_params_normal)
      @sivic_discipulo.sivic_pessoa_id = pessoa.id
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
      params.require(:sivic_discipulo).permit(:sivic_profissao_id, :DESC_TelefoneFixo, :DESC_TelefoneCelular,:sivic_cidade_id, :sivic_escolaridade_id, :sivic_rede_id, :sivic_celula_id, :NUMG_ProfissaoConjuge, :NUMG_UsuarioInclusao, :NUMG_UsuarioBloqueio, :DESC_Sexo, :DATA_Nascimento, :DESC_Apelido, :DESC_EstadoCivil, :NOME_Conjuge, :DATA_Decisao, :NUMR_QtdFilhos, :FLAG_Consolidador, :FLAG_Discipulo, :FLAG_Discipulador, :FLAG_OcasiaoRecebeuCristo, :FLAG_Reconciliacao, :FLAG_Trabalhando, :DESC_MomentoEstudoBiblico, :NUMR_RG, :DATA_EmissaoRG, :NUMR_CPF, :NOME_Pai, :NOME_Mae, :DATA_NascConjuge, :DATA_Casamento, :NUMR_TituloEleitoral, :DATA_Batismo, :DESC_IgrejaBatismo, :FLAG_DoadorSangue, :FLAG_DoadorOrgao, :NUMR_Codigo,:hora_estudobiblico, sivic_pessoa_attributes: [:sivic_situacaodiscipulo_id, :id, :nome_pessoa, :DESC_email, :DESC_observacao, :User_id, :sivic_igreja_id, :father_id], sivic_endereco_attributes: [ :id, :DESC_Bairro, :DESC_Rua, :DESC_Complemento, :DESC_Pontoreferencia, :NUMR_Cep, :sivic_cidade_id])
    end

    def sivic_discipulo_params_normal
      params.require(:sivic_discipulo).permit(:father_id, :sivic_pessoa_id, :DESC_TelefoneFixo, :DESC_TelefoneCelular, :sivic_cidade_id, :sivic_profissao_id, :sivic_escolaridade_id, :sivic_rede_id, :sivic_celula_id, :NUMG_ProfissaoConjuge, :NUMG_UsuarioInclusao, :NUMG_UsuarioBloqueio, :DESC_Sexo, :DATA_Nascimento, :DESC_Apelido, :DESC_EstadoCivil, :NOME_Conjuge, :DATA_Decisao,:FLAG_Consolidador, :NUMR_QtdFilhos, :FLAG_Discipulo, :FLAG_OcasiaoRecebeuCristo, :FLAG_Reconciliacao, :FLAG_Trabalhando, :DESC_MomentoEstudoBiblico, :NUMR_RG, :DATA_EmissaoRG, :NUMR_CPF, :NOME_Pai, :NOME_Mae, :DATA_NascConjuge, :DATA_Casamento, :NUMR_TituloEleitoral, :DATA_Batismo, :DESC_IgrejaBatismo, :FLAG_DoadorSangue, :FLAG_DoadorOrgao, :NUMR_Codigo, :hora_estudobiblico, sivic_endereco_attributes: [ :id, :DESC_Bairro, :DESC_Rua, :DESC_Complemento, :DESC_Pontoreferencia, :NUMR_Cep, :sivic_cidade_id ])
    end    
end
