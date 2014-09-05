class SivicInscricaosController < ApplicationController
  before_action :set_sivic_inscricao, only: [:show, :edit, :update, :destroy]

  # GET /sivic_inscricaos
  # GET /sivic_inscricaos.json
  def index
    @sivic_inscricaos = SivicInscricao.all
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
        format.html { redirect_to @sivic_inscricao, notice: 'Sivic inscricao was successfully created.' }
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
      params.require(:sivic_inscricao).permit(:nome_igreja, :nome_pessoa, :desc_telefone, :numg_cidade, :desc_email, :desc_senha, :desc_confirmasenha)
    end
end
