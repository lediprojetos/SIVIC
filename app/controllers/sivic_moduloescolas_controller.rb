class SivicModuloescolasController < ApplicationController
  before_action :set_sivic_moduloescola, only: [:show, :edit, :update, :destroy]

  # GET /sivic_moduloescolas
  # GET /sivic_moduloescolas.json
  def index
    @sivic_moduloescolas = SivicModuloescola.all
  end

  # GET /sivic_moduloescolas/1
  # GET /sivic_moduloescolas/1.json
  def show
  end

  # GET /sivic_moduloescolas/new
  def new
    @sivic_moduloescola = SivicModuloescola.new
  end

  # GET /sivic_moduloescolas/1/edit
  def edit
  end

  # POST /sivic_moduloescolas
  # POST /sivic_moduloescolas.json
  def create
    @sivic_moduloescola = SivicModuloescola.new(sivic_moduloescola_params)

    respond_to do |format|
      if @sivic_moduloescola.save
        format.html { redirect_to @sivic_moduloescola, notice: 'Registro incluido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_moduloescola }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_moduloescola.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_moduloescolas/1
  # PATCH/PUT /sivic_moduloescolas/1.json
  def update
    respond_to do |format|
      if @sivic_moduloescola.update(sivic_moduloescola_params)
        format.html { redirect_to @sivic_moduloescola, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_moduloescola.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_moduloescolas/1
  # DELETE /sivic_moduloescolas/1.json
  def destroy
    @sivic_moduloescola.destroy
    respond_to do |format|
      format.html { redirect_to sivic_moduloescolas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_moduloescola
      @sivic_moduloescola = SivicModuloescola.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_moduloescola_params
      params.require(:sivic_moduloescola).permit(:sivic_igreja_id, :user_id, :nome_modulo)
    end
end
