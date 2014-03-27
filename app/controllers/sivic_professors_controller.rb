class SivicProfessorsController < ApplicationController
  before_action :set_sivic_professor, only: [:show, :edit, :update, :destroy]

  # GET /sivic_professors
  # GET /sivic_professors.json
  def index
      
   # debugger

    if params[:sivic_professor_situacao_id] == nil
      params[:sivic_professor_situacao_id] = '0'
    end

   if params[:sivic_professor_situacao_id] == '0'
      @sivic_professors = SivicProfessor.all
   elsif params[:sivic_professor_situacao_id] == '1'
      @sivic_professors = SivicProfessor.where("DATA_bloqueio is null")
   elsif params[:sivic_professor_situacao_id] == '2'
      @sivic_professors = SivicProfessor.where("DATA_bloqueio is not null")
   elsif
    @sivic_relatorioscelulas = SivicProfessor.all
   end    
  end

  # GET /sivic_professors/1
  # GET /sivic_professors/1.json
  def show
  end

  # GET /sivic_professors/new
  def new
    @sivic_professor = SivicProfessor.new
  end

  # GET /sivic_professors/1/edit
  def edit
  end

  # POST /sivic_professors
  # POST /sivic_professors.json
  def create
    @sivic_professor = SivicProfessor.new(sivic_professor_params)

    respond_to do |format|
      if @sivic_professor.save
        format.html { redirect_to @sivic_professor, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_professor }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo para encerrar o evento
  def bloquea 
    @sivic_professor = SivicProfessor.find("#{params[:id]}%")
    @sivic_professor.update(:DATA_bloqueio => Time.now)

    respond_to do |format|
    format.html { redirect_to sivic_professors_path }
    format.json { head :no_content }
    end
  end

  # PATCH/PUT /sivic_professors/1
  # PATCH/PUT /sivic_professors/1.json
  def update
    respond_to do |format|
      if @sivic_professor.update(sivic_professor_params)
        format.html { redirect_to @sivic_professor, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_professors/1
  # DELETE /sivic_professors/1.json
  def destroy
    @sivic_professor.destroy
    respond_to do |format|
      format.html { redirect_to sivic_professors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_professor
      @sivic_professor = SivicProfessor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_professor_params
      params.require(:sivic_professor).permit(:sivic_pessoa_id, :user_id, :user_id, :DATA_bloqueio)
    end
end