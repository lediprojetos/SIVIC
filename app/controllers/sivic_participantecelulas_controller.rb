class SivicParticipantecelulasController < ApplicationController
  before_action :set_sivic_participantecelula, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def create_participante

    SivicParticipantecelula.create(:nome_participante => params[:nome_participante],:DESC_Email => params[:DESC_Email],:NUMR_Telefone => params[:NUMR_Telefone],:sivic_sitpartcelula_id => params[:sivic_sitpartcelula_id], :sivic_celula_id => params[:sivic_celula_id])
    sivic_participante = SivicParticipantecelula.find :all, :conditions => {:nome_participante => params[:nome_participante],:DESC_Email => params[:DESC_Email],:NUMR_Telefone => params[:NUMR_Telefone]}, :order => "nome_participante ASC"
    sivic_participante_json = sivic_participante.map {|item| {:id => item.id, :nome_participante => item.nome_participante, :sivic_sitpartcelula_id => item.sivic_sitpartcelula.id}}
    render :json => sivic_participante_json

  end

  def busca_participante

   #debugger
   
    sivic_participante = SivicParticipantecelula.where("sivic_celula_id = #{params[:sivic_celula_id]} and nome_participante like ?", "#{params[:nome_participante]}%")
    sivic_participante_json = sivic_participante.map {|item| {:id => item.id, :nome_participante => item.nome_participante, :id_Situacao => item.sivic_sitpartcelula_id, :DESC_SituacaoParticipante => item.sivic_sitpartcelula.DESC_situacao}}
    render :json => sivic_participante_json

  end     

  # GET /sivic_participantecelulas
  # GET /sivic_participantecelulas.json
  def index
     
      if current_user.role == 'LIDER_DE_CELULAS'
         @sivic_participantecelulas = SivicParticipantecelula.joins(:sivic_celula).where(sivic_celulas: {sivic_pessoa_id: current_user.sivic_pessoa.id}).paginate(:page => params[:page], :per_page => 10)
       else
        @sivic_participantecelulas = SivicParticipantecelula.joins(:sivic_celula).where(sivic_celulas: {sivic_igreja_id: current_user.sivic_pessoa.sivic_igreja_id}).paginate(:page => params[:page], :per_page => 10)
      end
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
        format.html { redirect_to @sivic_participantecelula, notice: 'Registro inserido com sucesso.' }
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
        format.html { redirect_to @sivic_participantecelula, notice: 'Registro alterado com sucesso.' }
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
      params.require(:sivic_participantecelula).permit(:nome_participante, :DESC_Email, :NUMR_Telefone, :sivic_sitpartcelula_id, :sivic_celula_id)
    end
end
