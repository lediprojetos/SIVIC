class SivicPermissaosController < ApplicationController
  before_action :set_sivic_permissao, only: [:show, :edit, :update, :destroy]

  # GET /sivic_permissaos
  # GET /sivic_permissaos.json
  def index
    @sivic_permissaos = SivicPermissao.all
  end

  # GET /sivic_permissaos/1
  # GET /sivic_permissaos/1.json
  def show
  end

  # GET /sivic_permissaos/new
  def new
    @sivic_permissao = SivicPermissao.new
  end

  # GET /sivic_permissaos/1/edit
  def edit
  end

  # POST /sivic_permissaos
  # POST /sivic_permissaos.json
  def create
    @sivic_permissao = SivicPermissao.new(sivic_permissao_params)

    respond_to do |format|
      if @sivic_permissao.save
        format.html { redirect_to @sivic_permissao, notice: 'Sivic permissao was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_permissao }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_permissao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_permissaos/1
  # PATCH/PUT /sivic_permissaos/1.json
  def update
    respond_to do |format|
      if @sivic_permissao.update(sivic_permissao_params)
        format.html { redirect_to @sivic_permissao, notice: 'Sivic permissao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_permissao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_permissaos/1
  # DELETE /sivic_permissaos/1.json
  def destroy
    @sivic_permissao.destroy
    respond_to do |format|
      format.html { redirect_to sivic_permissaos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_permissao
      @sivic_permissao = SivicPermissao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_permissao_params
      params.require(:sivic_permissao).permit(:mome_model, :mumr_acao, :desc_permissao, :sivic_model_id)
    end
end
