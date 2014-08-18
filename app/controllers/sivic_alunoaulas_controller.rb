class SivicAlunoaulasController < ApplicationController
  before_action :set_sivic_alunoaula, only: [:show, :edit, :update, :destroy]

  # GET /sivic_alunoaulas
  # GET /sivic_alunoaulas.json
  def index
    @sivic_alunoaulas = SivicAlunoaula.all
    @sivic_turmamoduloprofessors = SivicTurmamoduloprofessor.find :all, :conditions => {:sivic_professor_id => current_user.sivic_pessoa.sivic_professor}
  end

  # GET /sivic_alunoaulas/1
  # GET /sivic_alunoaulas/1.json
  def show
  end

  def frequencia

    @sivic_aula = SivicAula.find(params[:id]) 
  
    #@sivic_alunoaulas = SivicAlunoaula.all
    #@sivic_turmamoduloprofessor = SivicTurmamoduloprofessor.find(params[:id])
    #sivic_aula.sivic_turmamoduloprofessor.sivic_turma_id
  end

  def aulafrequencia
       @sivic_aulas  = SivicAula.joins(:sivic_turmamoduloprofessor).where(sivic_turmamoduloprofessors: {sivic_turma_id: params[:id]})
       @sivic_turma_id = params[:id]
  end

  def busca_aluno_aula
    @sivic_alunosaula = SivicAlunoaula.find :all, :conditions => {:sivic_aula_id => params[:sivic_aula_id]}
    @sivic_alunosaula_json = @sivic_alunosaula.map {|item| {:id => item.id, :nome_pessoa => item.sivic_turmaaluno.sivic_pessoa.nome_pessoa, :flag_ausente =>item.flag_ausente}}
    render :json => @sivic_alunosaula_json
    
  end

  def marcar_ausente

      @sivic_alunoaula = SivicAlunoaula.find(params[:id_aula])
  
      respond_to do |format|
      if @sivic_alunoaula.update(:flag_ausente => 2)
        format.html { redirect_to @sivic_alunoaula, notice: '' }
        format.json { render action: 'frequencia', status: :created, location: @sivic_alunoaula }
      else
        format.html { render action: 'frequencia' }
        format.json { render json: @sivic_alunoaula.errors, status: :unprocessable_entity }
      end
    end    

  end

 def marcar_presenca

      @sivic_alunoaula = SivicAlunoaula.find(params[:id_aula])
  
      respond_to do |format|
      if @sivic_alunoaula.update(:flag_ausente => 1)
        format.html { redirect_to @sivic_alunoaula, notice: '' }
        format.json { render action: 'frequencia', status: :created, location: @sivic_alunoaula }
      else
        format.html { render action: 'frequencia' }
        format.json { render json: @sivic_alunoaula.errors, status: :unprocessable_entity }
      end
    end    
  end

  def busca_aulas_aluno
    @sivic_turmamoduloprofessors = SivicTurmamoduloprofessor.find :all, :conditions => {:sivic_professor_id => current_user.sivic_pessoa.sivic_professor}
  end

  # GET /sivic_alunoaulas/new
  def new
    @sivic_alunoaula = SivicAlunoaula.new
  end

  # GET /sivic_alunoaulas/1/edit
  def edit
  end

  # POST /sivic_alunoaulas
  # POST /sivic_alunoaulas.json
  def create
    @sivic_alunoaula = SivicAlunoaula.new(sivic_alunoaula_params)

    respond_to do |format|
      if @sivic_alunoaula.save
        format.html { redirect_to @sivic_alunoaula, notice: 'Sivic alunoaula was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_alunoaula }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_alunoaula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_alunoaulas/1
  # PATCH/PUT /sivic_alunoaulas/1.json
  def update
    respond_to do |format|
      if @sivic_alunoaula.update(sivic_alunoaula_params)
        format.html { redirect_to @sivic_alunoaula, notice: 'Sivic alunoaula was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_alunoaula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_alunoaulas/1
  # DELETE /sivic_alunoaulas/1.json
  def destroy
    @sivic_alunoaula.destroy
    respond_to do |format|
      format.html { redirect_to sivic_alunoaulas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_alunoaula
      @sivic_alunoaula = SivicAlunoaula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_alunoaula_params
      params.require(:sivic_alunoaula).permit(:sivic_turmaaluno_id, :sivic_aula_id, :flag_ausente)
    end
end
