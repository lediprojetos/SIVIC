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
        
        @igreja = SivicIgreja.new
        @igreja.NOME_igreja = sivic_inscricao_params["nome_igreja"]
        @igreja.NUMR_telefone = sivic_inscricao_params["desc_telefone"]
        @igreja.NOME_responsavel = sivic_inscricao_params["nome_pessoa"]
        @igreja.save

        @pessoa = SivicPessoa.new
        @pessoa.nome_pessoa = sivic_inscricao_params["nome_pessoa"]
        @pessoa.DESC_email = sivic_inscricao_params["desc_email"]
        @pessoa.sivic_igreja_id = @igreja.id
        @pessoa.save

        @User = User.new
        @User.sivic_pessoa_id = @pessoa.id
        @User.email = sivic_inscricao_params["desc_email"]
        @User.password = sivic_inscricao_params["desc_senha"]
        @User.password_confirmation = sivic_inscricao_params["desc_confirmasenha"]
        @User.role = "ADMINISTRADOR"
        @User.save

        @SivicContcelula = SivicContcelula.new
        @SivicContcelula.NUMR_Contador = 0
        @SivicContcelula.sivic_igreja_id = @igreja.id
        @SivicContcelula.save
        
        @SivicContdiscipulo = SivicContdiscipulo.new
        @SivicContdiscipulo.NUMR_Contador = 0
        @SivicContdiscipulo.sivic_igreja_id = @igreja.id
        @SivicContdiscipulo.save


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
      params.require(:sivic_inscricao).permit(:desc_confirmaemail, :nome_igreja, :nome_pessoa, :desc_telefone, :numg_cidade, :desc_email, :desc_senha, :desc_confirmasenha)
    end
end