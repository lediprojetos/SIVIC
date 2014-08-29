class SivicSituacaodiscipulosController < ApplicationController
  before_action :set_sivic_situacaodiscipulo, only: [:show, :edit, :update, :destroy]

  # GET /sivic_situacaodiscipulos
  # GET /sivic_situacaodiscipulos.json
  def index
    @sivic_situacaodiscipulos = SivicSituacaodiscipulo.all
  end

  # GET /sivic_situacaodiscipulos/1
  # GET /sivic_situacaodiscipulos/1.json
  def show
  end

  # GET /sivic_situacaodiscipulos/new
  def new
    @sivic_situacaodiscipulo = SivicSituacaodiscipulo.new
  end

  # GET /sivic_situacaodiscipulos/1/edit
  def edit
  end

  # POST /sivic_situacaodiscipulos
  # POST /sivic_situacaodiscipulos.json
  def create
    @sivic_situacaodiscipulo = SivicSituacaodiscipulo.new(sivic_situacaodiscipulo_params)

    respond_to do |format|
      if @sivic_situacaodiscipulo.save
        format.html { redirect_to @sivic_situacaodiscipulo, notice: 'Sivic situacaodiscipulo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_situacaodiscipulo }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_situacaodiscipulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_situacaodiscipulos/1
  # PATCH/PUT /sivic_situacaodiscipulos/1.json
  def update
    respond_to do |format|
      if @sivic_situacaodiscipulo.update(sivic_situacaodiscipulo_params)
        format.html { redirect_to @sivic_situacaodiscipulo, notice: 'Sivic situacaodiscipulo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_situacaodiscipulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_situacaodiscipulos/1
  # DELETE /sivic_situacaodiscipulos/1.json
  def destroy
    @sivic_situacaodiscipulo.destroy
    respond_to do |format|
      format.html { redirect_to sivic_situacaodiscipulos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_situacaodiscipulo
      @sivic_situacaodiscipulo = SivicSituacaodiscipulo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_situacaodiscipulo_params
      params.require(:sivic_situacaodiscipulo).permit(:sivic_igreja_id, :user_inclusao, :user_exclusao, :nome_situacao, :data_exclusao)
    end
end
