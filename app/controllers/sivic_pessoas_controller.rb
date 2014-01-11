class SivicPessoasController < ApplicationController
  before_action :set_sivic_pessoa, only: [:show, :edit, :update, :destroy]

  # GET /sivic_pessoas
  # GET /sivic_pessoas.json
  def index
    @sivic_pessoas = SivicPessoa.all
  end

  # GET /sivic_pessoas/1
  # GET /sivic_pessoas/1.json
  def show
  end

  # GET /sivic_pessoas/new
  def new
    @sivic_pessoa = SivicPessoa.new

    @sivic_user = User.all
    @sivic_igreja = SivicIgreja.all
  end

  # GET /sivic_pessoas/1/edit
  def edit
    @sivic_user = User.all
    @sivic_igreja = SivicIgreja.all
  end

  # POST /sivic_pessoas
  # POST /sivic_pessoas.json
  def create
    @sivic_pessoa = SivicPessoa.new(sivic_pessoa_params)

    respond_to do |format|
      if @sivic_pessoa.save
        format.html { redirect_to @sivic_pessoa, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_pessoa }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_pessoas/1
  # PATCH/PUT /sivic_pessoas/1.json
  def update
    respond_to do |format|
      if @sivic_pessoa.update(sivic_pessoa_params)
        format.html { redirect_to @sivic_pessoa, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_pessoas/1
  # DELETE /sivic_pessoas/1.json
  def destroy
    @sivic_pessoa.destroy
    respond_to do |format|
      format.html { redirect_to sivic_pessoas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_pessoa
      @sivic_pessoa = SivicPessoa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_pessoa_params
      params.require(:sivic_pessoa).permit(:NOME_pessoa, :DESC_email, :DESC_observacao, :sivic_igreja_id, :User_id)
    end
end
