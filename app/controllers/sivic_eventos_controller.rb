class SivicEventosController < ApplicationController
  before_action :set_sivic_evento, only: [:show, :edit, :update, :destroy]

  # GET /sivic_eventos
  # GET /sivic_eventos.json
  def index
    @sivic_eventos = SivicEvento.all
  end

  # GET /sivic_eventos/1
  # GET /sivic_eventos/1.json
  def show
  end

  # GET /sivic_eventos/new
  def new
    @sivic_evento = SivicEvento.new
  end

  # GET /sivic_eventos/1/edit
  def edit
  end

  # POST /sivic_eventos
  # POST /sivic_eventos.json
  def create
    @sivic_evento = SivicEvento.new(sivic_evento_params)

    respond_to do |format|
      if @sivic_evento.save
        format.html { redirect_to @sivic_evento, notice: 'Sivic evento was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_evento }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_eventos/1
  # PATCH/PUT /sivic_eventos/1.json
  def update
    respond_to do |format|
      if @sivic_evento.update(sivic_evento_params)
        format.html { redirect_to @sivic_evento, notice: 'Sivic evento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_eventos/1
  # DELETE /sivic_eventos/1.json
  def destroy
    @sivic_evento.destroy
    respond_to do |format|
      format.html { redirect_to sivic_eventos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_evento
      @sivic_evento = SivicEvento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_evento_params
      params.require(:sivic_evento).permit(:DESC_evento, :DESC_resumo, :VARL_inscricao, :DATA_inicio, :DATA_fim, :FLAG_ilimitado, :NUMR_qdtVagas, :sivic_user_id, :sivic_igreja_id, :sivic_endereco_id, :sivic_tipoEvento_id)
    end
end
