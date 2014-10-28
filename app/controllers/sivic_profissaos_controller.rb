class SivicProfissaosController < ApplicationController
  before_action :set_sivic_profissao, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sivic_profissaos
  # GET /sivic_profissaos.json
  def index
    @sivic_profissaos = SivicProfissao.all
  end

  # GET /sivic_profissaos/1
  # GET /sivic_profissaos/1.json
  def show
  end

  # GET /sivic_profissaos/new
  def new
    @sivic_profissao = SivicProfissao.new
  end

  # GET /sivic_profissaos/1/edit
  def edit
  end

  # POST /sivic_profissaos
  # POST /sivic_profissaos.json
  def create
    @sivic_profissao = SivicProfissao.new(sivic_profissao_params)

    respond_to do |format|
      if @sivic_profissao.save
        format.html { redirect_to @sivic_profissao, notice: 'Sivic profissao was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_profissao }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_profissao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_profissaos/1
  # PATCH/PUT /sivic_profissaos/1.json
  def update
    respond_to do |format|
      if @sivic_profissao.update(sivic_profissao_params)
        format.html { redirect_to @sivic_profissao, notice: 'Sivic profissao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_profissao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_profissaos/1
  # DELETE /sivic_profissaos/1.json
  def destroy
    @sivic_profissao.destroy
    respond_to do |format|
      format.html { redirect_to sivic_profissaos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_profissao
      @sivic_profissao = SivicProfissao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_profissao_params
      params.require(:sivic_profissao).permit(:profissao)
    end
end
