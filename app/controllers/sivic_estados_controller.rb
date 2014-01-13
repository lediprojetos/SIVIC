class SivicEstadosController < ApplicationController
  before_action :set_sivic_estado, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sivic_estados
  # GET /sivic_estados.json
  def index
    @sivic_estados = SivicEstado.all
  end

  # GET /sivic_estados/1
  # GET /sivic_estados/1.json
  def show
  end

  # GET /sivic_estados/new
  def new
    @sivic_estado = SivicEstado.new
  end

  # GET /sivic_estados/1/edit
  def edit
  end

  # POST /sivic_estados
  # POST /sivic_estados.json
  def create
    @sivic_estado = SivicEstado.new(sivic_estado_params)

    respond_to do |format|
      if @sivic_estado.save
        format.html { redirect_to @sivic_estado, notice: 'Sivic estado was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_estado }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_estados/1
  # PATCH/PUT /sivic_estados/1.json
  def update
    respond_to do |format|
      if @sivic_estado.update(sivic_estado_params)
        format.html { redirect_to @sivic_estado, notice: 'Sivic estado was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_estados/1
  # DELETE /sivic_estados/1.json
  def destroy
    @sivic_estado.destroy
    respond_to do |format|
      format.html { redirect_to sivic_estados_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_estado
      @sivic_estado = SivicEstado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_estado_params
      params.require(:sivic_estado).permit(:nome_estado, :sigl_estado)
    end
end
