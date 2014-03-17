class SivicSituacoesrelatoriosController < ApplicationController
  before_action :set_sivic_situacoesrelatorio, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sivic_situacoesrelatorios
  # GET /sivic_situacoesrelatorios.json
  def index
    @sivic_situacoesrelatorios = SivicSituacoesrelatorio.all
  end

  # GET /sivic_situacoesrelatorios/1
  # GET /sivic_situacoesrelatorios/1.json
  def show
  end

  # GET /sivic_situacoesrelatorios/new
  def new
    @sivic_situacoesrelatorio = SivicSituacoesrelatorio.new
  end

  # GET /sivic_situacoesrelatorios/1/edit
  def edit
  end

  # POST /sivic_situacoesrelatorios
  # POST /sivic_situacoesrelatorios.json
  def create
    @sivic_situacoesrelatorio = SivicSituacoesrelatorio.new(sivic_situacoesrelatorio_params)

    respond_to do |format|
      if @sivic_situacoesrelatorio.save
        format.html { redirect_to @sivic_situacoesrelatorio, notice: 'Sivic situacoesrelatorio was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_situacoesrelatorio }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_situacoesrelatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_situacoesrelatorios/1
  # PATCH/PUT /sivic_situacoesrelatorios/1.json
  def update
    respond_to do |format|
      if @sivic_situacoesrelatorio.update(sivic_situacoesrelatorio_params)
        format.html { redirect_to @sivic_situacoesrelatorio, notice: 'Sivic situacoesrelatorio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_situacoesrelatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_situacoesrelatorios/1
  # DELETE /sivic_situacoesrelatorios/1.json
  def destroy
    @sivic_situacoesrelatorio.destroy
    respond_to do |format|
      format.html { redirect_to sivic_situacoesrelatorios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_situacoesrelatorio
      @sivic_situacoesrelatorio = SivicSituacoesrelatorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_situacoesrelatorio_params
      params.require(:sivic_situacoesrelatorio).permit(:DESC_Situacao)
    end
end
