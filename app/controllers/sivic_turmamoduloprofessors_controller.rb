class SivicTurmamoduloprofessorsController < ApplicationController
  before_action :set_sivic_turmamoduloprofessor, only: [:show, :edit, :update, :destroy]

  # GET /sivic_turmamoduloprofessors
  # GET /sivic_turmamoduloprofessors.json
  def index
    @sivic_turmamoduloprofessors = SivicTurmamoduloprofessor.all
  end

  # GET /sivic_turmamoduloprofessors/1
  # GET /sivic_turmamoduloprofessors/1.json
  def show
  end

  # GET /sivic_turmamoduloprofessors/new
  def new
    @sivic_turmamoduloprofessor = SivicTurmamoduloprofessor.new
  end

  # GET /sivic_turmamoduloprofessors/1/edit
  def edit
  end

  def create_turma_modulo_professor 

      sivic_turmamoduloprofessor = SivicTurmamoduloprofessor.find :all, :conditions => {:sivic_professor_id => params[:sivic_professor_id], :sivic_moduloescola_id => params[:sivic_moduloescola_id], :sivic_turma_id => params[:sivic_turma_id]}
      @sivic_turma = SivicTurma.find(params[:sivic_turma_id])

    if sivic_turmamoduloprofessor.empty?
       @sivic_turmamoduloprofessor = SivicTurmamoduloprofessor.new(:sivic_professor_id => params[:sivic_professor_id], :sivic_moduloescola_id => params[:sivic_moduloescola_id], :sivic_turma_id => params[:sivic_turma_id])    
            
      respond_to do |format|
      if @sivic_turmamoduloprofessor.save
        format.html { redirect_to @sivic_turma }
        format.json { render action: 'show', status: :created, location: @sivic_turma }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_turma.errors, status: :unprocessable_entity }
      end
    end

    else
      sivic_turmamoduloprofessor_json = sivic_turmamoduloprofessor.map {|item| {:id => item.id, :sivic_turma_id => item.sivic_turma_id, :nome_turma => item.sivic_turma.DESC_turma, :nome_professor => item.sivic_professor.sivic_pessoa.nome_pessoa, :nome_modulo => item.sivic_moduloescola.nome_modulo}}
      render :json => sivic_turmamoduloprofessor_json
    end
  end

  def busca_modulo_professor
  
 	  sivic_turmamoduloprofessor = SivicTurmamoduloprofessor.where(sivic_turma_id: params[:sivic_turmas_id]).to_a
 	  sivic_turmamoduloprofessor_json = sivic_turmamoduloprofessor.map {|item| {:id => item.id, :sivic_turma_id => item.sivic_turma_id, :nome_turma => item.sivic_turma.DESC_turma, :nome_professor => item.sivic_professor.sivic_pessoa.nome_pessoa, :nome_modulo => item.sivic_moduloescola.nome_modulo}}
    render :json => sivic_turmamoduloprofessor_json    

end

  # POST /sivic_turmamoduloprofessors
  # POST /sivic_turmamoduloprofessors.json
  def create
    @sivic_turmamoduloprofessor = SivicTurmamoduloprofessor.new(sivic_turmamoduloprofessor_params)

    respond_to do |format|
      if @sivic_turmamoduloprofessor.save
        format.html { redirect_to @sivic_turmamoduloprofessor, notice: 'Sivic turmamoduloprofessor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_turmamoduloprofessor }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_turmamoduloprofessor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_turmamoduloprofessors/1
  # PATCH/PUT /sivic_turmamoduloprofessors/1.json
  def update
    respond_to do |format|
      if @sivic_turmamoduloprofessor.update(sivic_turmamoduloprofessor_params)
        format.html { redirect_to @sivic_turmamoduloprofessor, notice: 'Sivic turmamoduloprofessor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_turmamoduloprofessor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_turmamoduloprofessors/1
  # DELETE /sivic_turmamoduloprofessors/1.json
  def destroy
    
    @sivic_turma = SivicTurma.find(@sivic_turmamoduloprofessor.sivic_turma_id)

    @sivic_turmamoduloprofessor.destroy
    respond_to do |format|
      format.html { redirect_to @sivic_turma }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_turmamoduloprofessor
      @sivic_turmamoduloprofessor = SivicTurmamoduloprofessor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_turmamoduloprofessor_params
      params.require(:sivic_turmamoduloprofessor).permit(:sivic_professors_id, :sivic_moduloescolas_id, :sivic_turmas_id)
    end
end
