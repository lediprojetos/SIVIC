class SivicAtividadesController < ApplicationController
  before_action :set_sivic_atividade, only: [:show, :edit, :update, :destroy, :deleta_atividade]

  # GET /sivic_atividades
  # GET /sivic_atividades.json
  def index
    #@sivic_atividades = SivicAtividade.all
    @sivic_atividades = SivicAtividade.find :all, :conditions => {:sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id, :data_exclusao => nil} 

  #@sivic_turmamoduloprofessors = SivicTurmamoduloprofessor.find :all, :conditions => {:sivic_professor_id => current_user.sivic_pessoa.sivic_professor}

  end

  # GET /si:vic_atividades/1sivic_igreja => current_user.sivic_pessoa.sivic_igreja_id
  # GET /sivic_atividades/1.json
  def show
  end

  # GET /sivic_atividades/new
  def new
    @sivic_atividade = SivicAtividade.new
  end

  # GET /sivic_atividades/1/edit
  def edit
  end

  # POST /sivic_atividades
  # POST /sivic_atividades.json
  def create
    @sivic_atividade = SivicAtividade.new(sivic_atividade_params)

    respond_to do |format|
      if @sivic_atividade.save
        format.html { redirect_to @sivic_atividade, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_atividade }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_atividade.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /sivic_atividades/1
  # PATCH/PUT /sivic_atividades/1.json
  def update
    respond_to do |format|
      if @sivic_atividade.update(sivic_atividade_params)
        format.html { redirect_to @sivic_atividade, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_atividade.errors, status: :unprocessable_entity }
      end
    end
  end


  def deleta_atividade

   @sivic_atividade.user_exclusao = current_user.id
   @sivic_atividade.data_exclusao =  Date.today
   @sivic_atividade.save
  
    respond_to do |format|
      format.html { redirect_to sivic_atividades_url }
      format.json { head :no_content }
    end

  end


  # DELETE /sivic_atividades/1
  # DELETE /sivic_atividades/1.json
  def destroy
    @sivic_atividade.destroy
    respond_to do |format|
      format.html { redirect_to sivic_atividades_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_atividade
      @sivic_atividade = SivicAtividade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_atividade_params
      params.require(:sivic_atividade).permit(:nome_atividade, :desc_atividade, :data_bloqueio, :data_exclusao, :sivic_periodicidadecon_id, :sivic_igreja_id, :user_inclusao, :user_bloqueio, :user_exclusao)
    end
end
