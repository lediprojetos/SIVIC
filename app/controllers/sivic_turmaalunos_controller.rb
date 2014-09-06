class SivicTurmaalunosController < ApplicationController
  before_action :set_sivic_turmaaluno, only: [:show, :edit, :update, :destroy]

  # GET /sivic_turmaalunos
  # GET /sivic_turmaalunos.json
  def index
    @sivic_turmaalunos = SivicTurmaaluno.find :all, :conditions => {:sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id}
  end

  # GET /sivic_turmaalunos/1
  # GET /sivic_turmaalunos/1.json
  def show
  end


 def busca_turmas
    @sivic_turmas = SivicTurma.find :all, :conditions => {:sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id}

    @sivic_turmas_json = @sivic_turmas.map {|item| {:id => item.id, :DESC_turma => item.DESC_turma, :nome_curso => item.sivic_curso.nome_curso, :DATA_Inicio => item.DATA_Inicio, :DATA_Fim => item.DATA_Fim}}
    render :json => @sivic_turmas_json
      
 end

  # GET /sivic_turmaalunos/new
  def new
    @sivic_turmaaluno = SivicTurmaaluno.new
  end

  # GET /sivic_turmaalunos/1/edit
  def edit
  end

  # POST /sivic_turmaalunos
  # POST /sivic_turmaalunos.json
  def create
    @sivic_turmaaluno = SivicTurmaaluno.new(sivic_turmaaluno_params)

    respond_to do |format|
      if @sivic_turmaaluno.save
        format.html { redirect_to @sivic_turmaaluno, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_turmaaluno }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_turmaaluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_turmaalunos/1
  # PATCH/PUT /sivic_turmaalunos/1.json
  def update
    respond_to do |format|
      if @sivic_turmaaluno.update(sivic_turmaaluno_params)
        format.html { redirect_to @sivic_turmaaluno, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_turmaaluno.errors, status: :unprocessable_entity }
      end
    end
  end

    # Metodo para bloquar turma
  def bloquea 
    @sivic_turmaaluno = SivicTurmaaluno.find(params[:id])
    @sivic_turmaaluno.update(:data_bloqueio => Time.now, :user_bloqueio => current_user.id)

    respond_to do |format|
    format.html {  redirect_to sivic_turmaalunos_url }
    format.json { head :no_content }
    end
  end


  def desbloquea
    @sivic_turmaaluno = SivicTurmaaluno.find(params[:id])
    @sivic_turmaaluno.update(:data_bloqueio => nil, :user_bloqueio => nil )

    respond_to do |format|
    format.html {  redirect_to sivic_turmaalunos_url }
    format.json { head :no_content }
    end
  end

  # DELETE /sivic_turmaalunos/1
  # DELETE /sivic_turmaalunos/1.json
  def destroy
    @sivic_turmaaluno.destroy
    respond_to do |format|
      format.html { redirect_to sivic_turmaalunos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_turmaaluno
      @sivic_turmaaluno = SivicTurmaaluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_turmaaluno_params
      params.require(:sivic_turmaaluno).permit(:sivic_turma_id, :sivic_pessoa_id, :user_inclusao, :user_inclusao, :data_bloqueio, :sivic_igreja_id)
    end
end
