class SivicEscolaridadesController < ApplicationController
  before_action :set_sivic_escolaridade, only: [:show, :edit, :update, :destroy]

  # GET /sivic_escolaridades
  # GET /sivic_escolaridades.json
  def index
    @sivic_escolaridades = SivicEscolaridade.all
  end

  # GET /sivic_escolaridades/1
  # GET /sivic_escolaridades/1.json
  def show
  end

  # GET /sivic_escolaridades/new
  def new
    @sivic_escolaridade = SivicEscolaridade.new
  end

  # GET /sivic_escolaridades/1/edit
  def edit
  end

  # POST /sivic_escolaridades
  # POST /sivic_escolaridades.json
  def create
    @sivic_escolaridade = SivicEscolaridade.new(sivic_escolaridade_params)

    respond_to do |format|
      if @sivic_escolaridade.save
        format.html { redirect_to @sivic_escolaridade, notice: 'Sivic escolaridade was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_escolaridade }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_escolaridade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_escolaridades/1
  # PATCH/PUT /sivic_escolaridades/1.json
  def update
    respond_to do |format|
      if @sivic_escolaridade.update(sivic_escolaridade_params)
        format.html { redirect_to @sivic_escolaridade, notice: 'Sivic escolaridade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_escolaridade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_escolaridades/1
  # DELETE /sivic_escolaridades/1.json
  def destroy
    @sivic_escolaridade.destroy
    respond_to do |format|
      format.html { redirect_to sivic_escolaridades_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_escolaridade
      @sivic_escolaridade = SivicEscolaridade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_escolaridade_params
      params.require(:sivic_escolaridade).permit(:escolaridade)
    end
end
