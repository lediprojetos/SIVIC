#encoding: utf-8
class SivicProfessorsController < ApplicationController
  before_action :set_sivic_professor, only: [:show, :edit, :update, :destroy]

  # GET /sivic_professors
  # GET /sivic_professors.json
  def index
      
   # debugger

    if params[:sivic_professor_situacao_id] == nil
       params[:sivic_professor_situacao_id] = '0'
    end

   if params[:sivic_professor_situacao_id] == '2'
      @sivic_professors = SivicProfessor.where(sivic_igreja_id: current_user.sivic_pessoa.sivic_igreja_id)
   elsif params[:sivic_professor_situacao_id] == '0'
      @sivic_professors = SivicProfessor.where('data_bloqueio is null and sivic_igreja_id = ?', current_user.sivic_pessoa.sivic_igreja_id)
   elsif params[:sivic_professor_situacao_id] == '1'
      @sivic_professors = SivicProfessor.where('data_bloqueio is not null and sivic_igreja_id = ?', current_user.sivic_pessoa.sivic_igreja_id)
   elsif
      @sivic_professors = SivicProfessor.where(sivic_igreja_id: current_user.sivic_pessoa.sivic_igreja_id)
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

    #@sivic_professor = SivicProfessor.find("#{params[:id]}")

    @sivic_professor = SivicProfessor.find(params[:id])

    @sivic_professor.update(:DATA_bloqueio => Time.now, :user_bloqueio => current_user.id)

    respond_to do |format|
    format.html { redirect_to sivic_professors_path }
    format.json { head :no_content }

    end
  end


    # Metodo para encerrar o evento
  def desbloquea

    #@sivic_professor = SivicProfessor.find("#{params[:id]}")

    @sivic_professor = SivicProfessor.find(params[:id])

    @sivic_professor.update(:DATA_bloqueio => nil, :user_bloqueio => nil)

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
      params.require(:sivic_professor).permit(:sivic_pessoa_id, :user_inclusao, :user_bloqueio, :DATA_bloqueio)
    end
end
