class SivicSitpartcelulasController < ApplicationController
  before_action :set_sivic_sitpartcelula, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sivic_sitpartcelulas
  # GET /sivic_sitpartcelulas.json
  def index
    @sivic_sitpartcelulas = SivicSitpartcelula.where(sivic_igreja_id: current_user.sivic_pessoa.sivic_igreja_id)
  end

  # GET /sivic_sitpartcelulas/1
  # GET /sivic_sitpartcelulas/1.json
  def show
  end

  # GET /sivic_sitpartcelulas/new
  def new
    @sivic_sitpartcelula = SivicSitpartcelula.new
  end

  # GET /sivic_sitpartcelulas/1/edit
  def edit
  end

  # POST /sivic_sitpartcelulas
  # POST /sivic_sitpartcelulas.json
  def create
    @sivic_sitpartcelula = SivicSitpartcelula.new(sivic_sitpartcelula_params)

    respond_to do |format|
      if @sivic_sitpartcelula.save
        format.html { redirect_to @sivic_sitpartcelula, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_sitpartcelula }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_sitpartcelula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_sitpartcelulas/1
  # PATCH/PUT /sivic_sitpartcelulas/1.json
  def update
    respond_to do |format|
      if @sivic_sitpartcelula.update(sivic_sitpartcelula_params)
        format.html { redirect_to @sivic_sitpartcelula, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_sitpartcelula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_sitpartcelulas/1
  # DELETE /sivic_sitpartcelulas/1.json
  def destroy
    @sivic_sitpartcelula.destroy
    respond_to do |format|
      format.html { redirect_to sivic_sitpartcelulas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_sitpartcelula
      @sivic_sitpartcelula = SivicSitpartcelula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_sitpartcelula_params
      params.require(:sivic_sitpartcelula).permit(:DESC_situacao, :sivic_igreja_id)
    end
end
