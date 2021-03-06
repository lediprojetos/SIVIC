class SivicEventosController < ApplicationController
  before_action :set_sivic_evento, only: [:show, :edit, :update, :destroy, :encerrar]
  before_action :authenticate_user!
  #load_and_authorize_resource
  
  # GET /sivic_eventos
  # GET /sivic_eventos.json
  def index
    @sivic_eventos = SivicEvento.where("data_encerramento is null and sivic_igreja_id = ?", current_user.sivic_pessoa.sivic_igreja_id).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /sivic_eventos/1
  # GET /sivic_eventos/1.json
  def show
  end

  # Metodo para encerrar o evento
  def encerrar 
    #@sivic_evento = SivicEvento.find("#{params[:id]}%")
    @sivic_evento.update(:data_encerramento => Time.now)

    respond_to do |format|
    format.html { redirect_to sivic_eventos_path }
    format.json { head :no_content }
    end
  end
 
 #busca todos os eventos
  def buscaEvento 
    #sivic_evento = SivicEvento.all
    sivic_evento = SivicEvento.where("data_encerramento is null and sivic_igreja_id =?",current_user.sivic_pessoa.sivic_igreja_id)
    sivic_evento_json = sivic_evento.map {|item| {:id => item.id, :TipoEvento => item.sivic_tipo_evento.desc_tipoevento, :desc_evento => item.desc_evento, :DATA_Inicio => item.DATA_inicio, :DATA_Fim => item.DATA_fim}}
    render :json => sivic_evento_json
  end
  
  
  # GET /sivic_eventos/new
  def new
    @sivic_evento = SivicEvento.new
    @sivic_evento.build_sivic_endereco
	  @user = User.new
	  @sivic_pessoa = SivicPessoa.new
  end

  # GET /sivic_eventos/1/edit
  def edit
    @sivic_estado = SivicEvento.find(params[:id])
    @sivic_estado = @sivic_estado.sivic_endereco.sivic_cidade.sivic_estado.id

    @sivic_cidade = SivicCidade.find :all, :conditions => {:sivic_estado_id => @sivic_estado}

    @sivic_cidade_setada = SivicEvento.find(params[:id])
    @sivic_cidade_setada = @sivic_cidade_setada.sivic_endereco.sivic_cidade.id

   # @sivic_sede = SivicEvento.find(params[:id])
   # @sivic_sede = @sivic_sede.father_id
  end

  # POST /sivic_eventos
  # POST /sivic_eventos.json
  def create
    @sivic_evento = SivicEvento.new(sivic_evento_params)

    respond_to do |format|
      if @sivic_evento.save
        format.html { redirect_to @sivic_evento, notice: 'Registro inserido com sucesso.' }
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
        format.html { redirect_to @sivic_evento, notice: 'Registro alterado com sucesso.' }
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
      params.require(:sivic_evento).permit(:desc_evento, :DESC_resumo, :VARL_inscricao, :DATA_inicio, :DATA_fim, :FLAG_ilimitado, :NUMR_qdtVagas, :User_id, :sivic_igreja_id, :sivic_tipo_evento_id, sivic_endereco_attributes: [ :id, :DESC_Bairro, :DESC_Rua, :DESC_Complemento, :DESC_Pontoreferencia, :NUMR_Cep, :sivic_cidade_id ])
    end
end
