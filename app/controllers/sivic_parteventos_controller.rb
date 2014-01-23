class SivicParteventosController < ApplicationController
  before_action :set_sivic_partevento, only: [:show, :edit, :update, :destroy]

  # GET /sivic_parteventos
  # GET /sivic_parteventos.json
  def index
    @sivic_parteventos = SivicPartevento.all
  end

  # GET /sivic_parteventos/1
  # GET /sivic_parteventos/1.json
  def show
  end

  # GET /sivic_parteventos/new
  def new
    @sivic_partevento = SivicPartevento.new
  end

  # GET /sivic_parteventos/1/edit
  def edit
  end

  # POST /sivic_parteventos
  # POST /sivic_parteventos.json
  def create
    @sivic_partevento = SivicPartevento.new(sivic_partevento_params)

    respond_to do |format|
      if @sivic_partevento.save
        format.html { redirect_to @sivic_partevento, notice: 'Sivic partevento was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_partevento }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_partevento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_parteventos/1
  # PATCH/PUT /sivic_parteventos/1.json
  def update
    respond_to do |format|
      if @sivic_partevento.update(sivic_partevento_params)
        format.html { redirect_to @sivic_partevento, notice: 'Sivic partevento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_partevento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_parteventos/1
  # DELETE /sivic_parteventos/1.json
  def destroy
    @sivic_partevento.destroy
    respond_to do |format|
      format.html { redirect_to sivic_parteventos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_partevento
      @sivic_partevento = SivicPartevento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_partevento_params
      params.require(:sivic_partevento).permit(:sivic_pessoa_id, :sivic_evento_id, :sivic_movimentofinanceiro_id, :FLAG_naoparticipou)
    end
end
