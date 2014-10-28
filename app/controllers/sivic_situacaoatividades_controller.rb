class SivicSituacaoatividadesController < ApplicationController
  before_action :set_sivic_situacaoatividade, only: [:show, :edit, :update, :destroy]

  # GET /sivic_situacaoatividades
  # GET /sivic_situacaoatividades.json
  def index
    @sivic_situacaoatividades = SivicSituacaoatividade.all
  end

  # GET /sivic_situacaoatividades/1
  # GET /sivic_situacaoatividades/1.json
  def show
  end

  # GET /sivic_situacaoatividades/new
  def new
    @sivic_situacaoatividade = SivicSituacaoatividade.new
  end

  # GET /sivic_situacaoatividades/1/edit
  def edit
  end

  # POST /sivic_situacaoatividades
  # POST /sivic_situacaoatividades.json
  def create
    @sivic_situacaoatividade = SivicSituacaoatividade.new(sivic_situacaoatividade_params)

    respond_to do |format|
      if @sivic_situacaoatividade.save
        format.html { redirect_to @sivic_situacaoatividade, notice: 'Sivic situacaoatividade was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_situacaoatividade }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_situacaoatividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_situacaoatividades/1
  # PATCH/PUT /sivic_situacaoatividades/1.json
  def update
    respond_to do |format|
      if @sivic_situacaoatividade.update(sivic_situacaoatividade_params)
        format.html { redirect_to @sivic_situacaoatividade, notice: 'Sivic situacaoatividade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_situacaoatividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_situacaoatividades/1
  # DELETE /sivic_situacaoatividades/1.json
  def destroy
    @sivic_situacaoatividade.destroy
    respond_to do |format|
      format.html { redirect_to sivic_situacaoatividades_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_situacaoatividade
      @sivic_situacaoatividade = SivicSituacaoatividade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_situacaoatividade_params
      params.require(:sivic_situacaoatividade).permit(:nome)
    end
end
