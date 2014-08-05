class SivicTurmasController < ApplicationController
  before_action :set_sivic_turma, only: [:show, :edit, :update, :destroy]

  # GET /sivic_turmas
  # GET /sivic_turmas.json
  def index   
  #  if params[:sivic_turma_situacao_id] == nil
  #    params[:sivic_turma_situacao_id] = '0'
  #  end

  #  if params[:sivic_turma_situacao_id] == '2'
  #    @sivic_turmas = SivicTurma.all  
  #  elsif params[:sivic_turma_situacao_id] == '0'
  #    @sivic_turmas = SivicTurma.where(DATA_bloqueio: nil)
  #  elsif  params[:sivic_turma_situacao_id] == '1'
  #    @sivic_turmas = SivicTurma.where.not(DATA_bloqueio: nil)
  #  elsif 
      @sivic_turmas = SivicTurma.find :all, :conditions => {:sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id}
  #  end

  end


  # GET /sivic_turmas/1
  # GET /sivic_turmas/1.json
  def show
  end

  # GET /sivic_turmas/new
  def new

    @sivic_turma = SivicTurma.new
  end

  # GET /sivic_turmas/1/edit
  def edit
  end

  # POST /sivic_turmas
  # POST /sivic_turmas.json
  def create
    @sivic_turma = SivicTurma.new(sivic_turma_params)

    respond_to do |format|
      if @sivic_turma.save
        format.html { redirect_to @sivic_turma, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_turma }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_turmas/1
  # PATCH/PUT /sivic_turmas/1.json
  def update
    respond_to do |format|
      if @sivic_turma.update(sivic_turma_params)
        format.html { redirect_to @sivic_turma, notice: 'Registro alterado com sucesso.'  }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo para bloquar turma
  def bloquea 
    @sivic_turma = SivicTurma.find(params[:id])
    @sivic_turma.update(:DATA_bloqueio => Time.now, :user_bloqueio => current_user.id)

    respond_to do |format|
    format.html {  redirect_to sivic_turmas_url }
    format.json { head :no_content }
    end
  end

  # DELETE /sivic_turmas/1
  # DELETE /sivic_turmas/1.json
  def destroy
    @sivic_turma.destroy
    respond_to do |format|
      format.html { redirect_to sivic_turmas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_turma
      @sivic_turma = SivicTurma.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_turma_params
      params.require(:sivic_turma).permit(:sivic_igreja_id, :user_inclusao, :user_bloqueio, :DESC_turma, :DATA_Inicio, :DATA_Fim, :NUMR_QdtVagas, :DATA_bloqueio, :sivic_curso_id)
    end
end
