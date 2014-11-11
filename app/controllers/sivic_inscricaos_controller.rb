#encoding: utf-8
class SivicInscricaosController < ApplicationController
  before_action :set_sivic_inscricao, only: [:show, :edit, :update, :destroy]

  # GET /sivic_inscricaos
  # GET /sivic_inscricaos.json
  def index
    respond_to do |format|
      format.html { redirect_to new_user_session_path, notice: 'Por favor realize o login.' }
    end
  end

  # GET /sivic_inscricaos/1
  # GET /sivic_inscricaos/1.json
  def show
  end

  # GET /sivic_inscricaos/new
  def new
    @sivic_inscricao = SivicInscricao.new
  end

  # GET /sivic_inscricaos/1/edit
  def edit
  end

  # POST /sivic_inscricaos
  # POST /sivic_inscricaos.json
  def create

    @sivic_inscricao = SivicInscricao.new(sivic_inscricao_params)

    respond_to do |format|
      if @sivic_inscricao.save
        

        @endereco = SivicEndereco.new
        @endereco.sivic_cidade_id = sivic_inscricao_params["numg_cidade"]
        @endereco.save

        @igreja = SivicIgreja.new
        @igreja.NOME_igreja = sivic_inscricao_params["nome_igreja"]
        @igreja.NUMR_telefone = sivic_inscricao_params["desc_telefone"]
        @igreja.NOME_responsavel = sivic_inscricao_params["nome_pessoa"]
        @igreja.flag_tradicional = sivic_inscricao_params["flag_tradicional"]
        @igreja.sivic_endereco_id = @endereco.id
        @igreja.save

        @pessoa = SivicPessoa.new
        @pessoa.nome_pessoa = sivic_inscricao_params["nome_pessoa"]
        @pessoa.DESC_email = sivic_inscricao_params["desc_email"]
        @pessoa.father_id = 0
        @pessoa.sivic_igreja_id = @igreja.id
        @pessoa.save

        @User = User.new
        @User.sivic_pessoa_id = @pessoa.id
        @User.email = sivic_inscricao_params["desc_email"]
        @User.password = sivic_inscricao_params["desc_senha"]
        @User.password_confirmation = sivic_inscricao_params["desc_confirmasenha"]
        @User.role = "ADMINISTRADOR"
        @User.save

        #Setando Permissões
          SivicUserpermissao.create(:sivic_permissao_id => 5, :user_id => @User.id) #Manage Discípulos
          SivicUserpermissao.create(:sivic_permissao_id => 48, :user_id => @User.id) #Manage Cadastrar Ministérios
          SivicUserpermissao.create(:sivic_permissao_id => 49, :user_id => @User.id) #Manage Tipos de Eventos
          SivicUserpermissao.create(:sivic_permissao_id => 15, :user_id => @User.id) #Manage Relatório de Células
          SivicUserpermissao.create(:sivic_permissao_id => 47, :user_id => @User.id) #Manage Eventos
          SivicUserpermissao.create(:sivic_permissao_id => 10, :user_id => @User.id) #Manage Células  
          SivicUserpermissao.create(:sivic_permissao_id => 50, :user_id => @User.id) #Manage Redes
          SivicUserpermissao.create(:sivic_permissao_id => 58, :user_id => @User.id) #Manage Atribuir Ministérios
          SivicUserpermissao.create(:sivic_permissao_id => 46, :user_id => @User.id) #Manage Usuários
          SivicUserpermissao.create(:sivic_permissao_id => 59, :user_id => @User.id) #Manage Permissão para Usuários

        
        format.html { redirect_to new_user_session_path, notice: 'Registro efetuado com sucesso. Por favor realize o login.' }
        format.json { render action: 'show', status: :created, location: @sivic_inscricao }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_inscricao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_inscricaos/1
  # PATCH/PUT /sivic_inscricaos/1.json
  def update
    respond_to do |format|
      if @sivic_inscricao.update(sivic_inscricao_params)
        format.html { redirect_to @sivic_inscricao, notice: 'Sivic inscricao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_inscricao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_inscricaos/1
  # DELETE /sivic_inscricaos/1.json
  def destroy
    @sivic_inscricao.destroy
    respond_to do |format|
      format.html { redirect_to sivic_inscricaos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_inscricao
      @sivic_inscricao = SivicInscricao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_inscricao_params
      params.require(:sivic_inscricao).permit(:desc_confirmaemail, :nome_igreja, :nome_pessoa, :desc_telefone, :numg_cidade, :desc_email, :desc_senha, :desc_confirmasenha, :flag_tradicional)
    end
end
