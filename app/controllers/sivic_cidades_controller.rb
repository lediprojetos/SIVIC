class SivicCidadesController < ApplicationController
  before_action :set_sivic_cidade, only: [:show, :edit, :update, :destroy]

  # GET /sivic_cidades
  # GET /sivic_cidades.json
  def index
    @sivic_cidades = SivicCidade.all
  end

  # GET /sivic_cidades/1
  # GET /sivic_cidades/1.json
  def show
  end

  # GET /sivic_cidades/new
  def new
    @sivic_cidade = SivicCidade.new
  end

  # GET /sivic_cidades/1/edit
  def edit
  end

  # POST /sivic_cidades
  # POST /sivic_cidades.json
  def create
    @sivic_cidade = SivicCidade.new(sivic_cidade_params)

    respond_to do |format|
      if @sivic_cidade.save
        format.html { redirect_to @sivic_cidade, notice: 'Sivic cidade was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_cidade }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_cidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_cidades/1
  # PATCH/PUT /sivic_cidades/1.json
  def update
    respond_to do |format|
      if @sivic_cidade.update(sivic_cidade_params)
        format.html { redirect_to @sivic_cidade, notice: 'Sivic cidade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_cidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_cidades/1
  # DELETE /sivic_cidades/1.json
  def destroy
    @sivic_cidade.destroy
    respond_to do |format|
      format.html { redirect_to sivic_cidades_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_cidade
      @sivic_cidade = SivicCidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_cidade_params
      params.require(:sivic_cidade).permit(:nome, :estado_id)
    end
end
