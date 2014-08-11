class SivicAulasController < ApplicationController
  before_action :set_sivic_aula, only: [:show, :edit, :update, :destroy]

  # GET /sivic_aulas
  # GET /sivic_aulas.json
  def index
    @sivic_aulas = SivicAula.all
  end

  # GET /sivic_aulas/1
  # GET /sivic_aulas/1.json
  def show
  end

  # GET /sivic_aulas/new
  def new
    @sivic_aula = SivicAula.new
  end

  # GET /sivic_aulas/1/edit
  def edit
  end

  # POST /sivic_aulas
  # POST /sivic_aulas.json
  def create
    @sivic_aula = SivicAula.new(sivic_aula_params)

    respond_to do |format|
      if @sivic_aula.save
        format.html { redirect_to @sivic_aula, notice: 'Sivic aula was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_aula }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_aula.errors, status: :unprocessable_entity }
      end
    end
  end


  def create_aula
    
   @sivic_aula = SivicAula.new(:nome_aula => params[:nome_aula], :data_aula => params[:data_aula], :sivic_igreja_id => params[:sivic_igreja_id], :sivic_turmamoduloprofessor_id => params[:sivic_turmamoduloprofessor_id], :user_inclusao => params[:user_inclusao])

   @sivic_turmamoduloprofessor = SivicTurmamoduloprofessor.find(params[:sivic_turmamoduloprofessor_id])

    respond_to do |format|
      if @sivic_aula.save
        format.html { redirect_to @sivic_turmamoduloprofessor, notice: 'Sivic aula was successfully created.' }
        format.json { render action: 'aula', status: :created, location: @sivic_turmamoduloprofessor }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_turmamoduloprofessor.errors, status: :unprocessable_entity }
      end
    end 
  end


  def busca_aula

    @sivic_aula =  SivicAula.find :all, :conditions => {:sivic_turmamoduloprofessor_id => params[:sivic_turmamoduloprofessor_id]}
    @sivic_aula_json = @sivic_aula.map {|item| {:id => item.id, :nome_aula => item.nome_aula, :data_aula => item.data_aula}}
    render :json => @sivic_aula_json
  
  end

  # PATCH/PUT /sivic_aulas/1
  # PATCH/PUT /sivic_aulas/1.json
  def update
    respond_to do |format|
      if @sivic_aula.update(sivic_aula_params)
        format.html { redirect_to @sivic_aula, notice: 'Sivic aula was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_aula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_aulas/1
  # DELETE /sivic_aulas/1.json
  def destroy
    @sivic_aula.destroy
    respond_to do |format|
      format.html { redirect_to sivic_aulas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_aula
      @sivic_aula = SivicAula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_aula_params
      params.require(:sivic_aula).permit(:nome_aula, :data_aula, :user_inclusao, :sivic_igreja_id, :sivic_turmamoduloprofessor_id)
    end
end
