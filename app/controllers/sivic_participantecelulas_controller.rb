class SivicParticipantecelulasController < ApplicationController
  before_action :set_sivic_participantecelula, only: [:show, :edit, :update, :destroy]


  def create_participante

    SivicParticipantecelula.create(:NOME_Participante => params[:NOME_Participante],:DESC_Email => params[:DESC_Email],:NUMR_Telefone => params[:NUMR_Telefone],:sivic_sitpartcelula_id => params[:sivic_sitpartcelula_id], :sivic_celula_id => params[:sivic_celula_id])
    sivic_participante = SivicParticipantecelula.find :all, :conditions => {:NOME_Participante => params[:NOME_Participante],:DESC_Email => params[:DESC_Email],:NUMR_Telefone => params[:NUMR_Telefone]}, :order => "NOME_Participante ASC"
    sivic_participante_json = sivic_participante.map {|item| {:id => item.id, :NOME_Participante => item.NOME_Participante, :sivic_sitpartcelula_id => item.sivic_sitpartcelula.id}}
    render :json => sivic_participante_json

  end

  def busca_participante

   #debugger
   
    sivic_participante = SivicParticipantecelula.where("sivic_celula_id = #{params[:sivic_celula_id]} and NOME_Participante like ?", "#{params[:NOME_Participante]}%")
    sivic_participante_json = sivic_participante.map {|item| {:id => item.id, :NOME_Participante => item.NOME_Participante, :id_Situacao => item.sivic_sitpartcelula_id, :DESC_SituacaoParticipante => item.sivic_sitpartcelula.DESC_situacao}}
    render :json => sivic_participante_json

  end     

  # GET /sivic_participantecelulas
  # GET /sivic_participantecelulas.json
  def index
    @sivic_participantecelulas = SivicParticipantecelula.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /sivic_participantecelulas/1
  # GET /sivic_participantecelulas/1.json
  def show
  end

  # GET /sivic_participantecelulas/new
  def new
    @sivic_participantecelula = SivicParticipantecelula.new
  end

  # GET /sivic_participantecelulas/1/edit
  def edit
  end

  # POST /sivic_participantecelulas
  # POST /sivic_participantecelulas.json
  def create

    @sivic_participantecelula = SivicParticipantecelula.new(sivic_participantecelula_params)

    respond_to do |format|
      if @sivic_participantecelula.save
        format.html { redirect_to @sivic_participantecelula, notice: 'Sivic participantecelula was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_participantecelula }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_participantecelula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_participantecelulas/1
  # PATCH/PUT /sivic_participantecelulas/1.json
  def update
    respond_to do |format|
      if @sivic_participantecelula.update(sivic_participantecelula_params)
        format.html { redirect_to @sivic_participantecelula, notice: 'Sivic participantecelula was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_participantecelula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_participantecelulas/1
  # DELETE /sivic_participantecelulas/1.json
  def destroy
    @sivic_participantecelula.destroy
    respond_to do |format|
      format.html { redirect_to sivic_participantecelulas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_participantecelula
      @sivic_participantecelula = SivicParticipantecelula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_participantecelula_params
      params.require(:sivic_participantecelula).permit(:NOME_Participante, :DESC_Email, :NUMR_Telefone, :sivic_sitpartcelula_id, :sivic_celula_id)
    end
end
