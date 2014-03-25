class SivicTurmasController < ApplicationController
  before_action :set_sivic_turma, only: [:show, :edit, :update, :destroy]

  # GET /sivic_turmas
  # GET /sivic_turmas.json
  def index
    @sivic_turmas = SivicTurma.all
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
        format.html { redirect_to @sivic_turma, notice: 'Sivic turma was successfully created.' }
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
        format.html { redirect_to @sivic_turma, notice: 'Sivic turma was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_turma.errors, status: :unprocessable_entity }
      end
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
      params.require(:sivic_turma).permit(:sivic_igreja_id, :user_id, :user_id, :DESC_turma, :DATA_Inicio, :DATA_Fim, :NUMR_QdtVagas, :DATA_bloqueio)
    end
end
