class SivicModulosController < ApplicationController
  before_action :set_sivic_modulo, only: [:show, :edit, :update, :destroy]

  # GET /sivic_modulos
  # GET /sivic_modulos.json
  def index
    @sivic_modulos = SivicModulo.all
  end

  # GET /sivic_modulos/1
  # GET /sivic_modulos/1.json
  def show
  end

  # GET /sivic_modulos/new
  def new
    @sivic_modulo = SivicModulo.new
  end

  # GET /sivic_modulos/1/edit
  def edit
  end

  # POST /sivic_modulos
  # POST /sivic_modulos.json
  def create
    @sivic_modulo = SivicModulo.new(sivic_modulo_params)

    respond_to do |format|
      if @sivic_modulo.save
        format.html { redirect_to @sivic_modulo, notice: 'Sivic modulo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_modulo }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_modulos/1
  # PATCH/PUT /sivic_modulos/1.json
  def update
    respond_to do |format|
      if @sivic_modulo.update(sivic_modulo_params)
        format.html { redirect_to @sivic_modulo, notice: 'Sivic modulo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_modulos/1
  # DELETE /sivic_modulos/1.json
  def destroy
    @sivic_modulo.destroy
    respond_to do |format|
      format.html { redirect_to sivic_modulos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_modulo
      @sivic_modulo = SivicModulo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_modulo_params
      params.require(:sivic_modulo).permit(:nome_modulo, :desc_modulo, :data_bloqueio)
    end
end
