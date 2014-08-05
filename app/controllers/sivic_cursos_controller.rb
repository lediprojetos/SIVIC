class SivicCursosController < ApplicationController
  before_action :set_sivic_curso, only: [:show, :edit, :update, :destroy]

  # GET /sivic_cursos
  # GET /sivic_cursos.json
  def index

    @sivic_cursos = SivicCurso.find :all, :conditions => {:sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id}

    #sivic_participante = SivicParticipantecelula.find :all, :conditions => {:sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id}
  end

  # GET /sivic_cursos/1
  # GET /sivic_cursos/1.json
  def show
  end

  # GET /sivic_cursos/new
  def new
    @sivic_curso = SivicCurso.new
  end

  # GET /sivic_cursos/1/edit
  def edit
  end

  # POST /sivic_cursos
  # POST /sivic_cursos.json
  def create
    @sivic_curso = SivicCurso.new(sivic_curso_params)

    respond_to do |format|
      if @sivic_curso.save
        format.html { redirect_to @sivic_curso, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_curso }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_cursos/1
  # PATCH/PUT /sivic_cursos/1.json
  def update
    respond_to do |format|
      if @sivic_curso.update(sivic_curso_params)
        format.html { redirect_to @sivic_curso, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_cursos/1
  # DELETE /sivic_cursos/1.json
  def destroy
    @sivic_curso.destroy
    respond_to do |format|
      format.html { redirect_to sivic_cursos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_curso
      @sivic_curso = SivicCurso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_curso_params
      params.require(:sivic_curso).permit(:nome_curso, :desc_curso, :sivic_igreja_id, :user_inclusao)
    end
end
