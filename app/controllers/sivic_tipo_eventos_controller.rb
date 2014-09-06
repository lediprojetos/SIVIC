class SivicTipoEventosController < ApplicationController
  before_action :set_sivic_tipo_evento, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /sivic_tipo_eventos
  # GET /sivic_tipo_eventos.json
  def index

    @sivic_tipo_eventos = SivicTipoEvento.where("sivic_igreja_id = ?", current_user.sivic_pessoa.sivic_igreja_id).paginate(:page => params[:page], :per_page => 10)
    #@sivic_tipo_eventos = SivicTipoEvento.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /sivic_tipo_eventos/1
  # GET /sivic_tipo_eventos/1.json
  def show
  end

  # GET /sivic_tipo_eventos/new
  def new
    @sivic_tipo_evento = SivicTipoEvento.new
  end

  # GET /sivic_tipo_eventos/1/edit
  def edit
  end

  # POST /sivic_tipo_eventos
  # POST /sivic_tipo_eventos.json
  def create
    @sivic_tipo_evento = SivicTipoEvento.new(sivic_tipo_evento_params)

    respond_to do |format|
      if @sivic_tipo_evento.save
        format.html { redirect_to @sivic_tipo_evento, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_tipo_evento }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_tipo_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_tipo_eventos/1
  # PATCH/PUT /sivic_tipo_eventos/1.json
  def update
    respond_to do |format|
      if @sivic_tipo_evento.update(sivic_tipo_evento_params)
        format.html { redirect_to @sivic_tipo_evento, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_tipo_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_tipo_eventos/1
  # DELETE /sivic_tipo_eventos/1.json
  def destroy
    @sivic_tipo_evento.destroy
    respond_to do |format|
      format.html { redirect_to sivic_tipo_eventos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_tipo_evento
      @sivic_tipo_evento = SivicTipoEvento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_tipo_evento_params
      params.require(:sivic_tipo_evento).permit(:desc_tipoevento, :sivic_igreja_id)
    end
end
