class SivicLicaosController < ApplicationController
  before_action :set_sivic_licao, only: [:show, :edit, :update, :destroy]

  # GET /sivic_licaos
  # GET /sivic_licaos.json
  def index

    @sivic_licaos = SivicLicao.all
    @sivic_turmamoduloprofessors = SivicTurmamoduloprofessor.find :all, :conditions => {:sivic_professor_id => current_user.sivic_pessoa.sivic_professor}

  end

  # GET /sivic_licaos/1
  # GET /sivic_licaos/1.json
  def show
  end

  # GET /sivic_licaos/new
  def new
    @sivic_licao = SivicLicao.new
  end

  # GET /sivic_licaos/1/edit
  def edit
  end

  # POST /sivic_licaos
  # POST /sivic_licaos.json
  def create
    @sivic_licao = SivicLicao.create(sivic_licao_params)

    respond_to do |format|
      if @sivic_licao.save
        format.html { redirect_to @sivic_licao, notice: 'Sivic licao was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_licao }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_licao.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /sivic_licaos
  # POST /sivic_licaos.json
  def create_licao
       
      @sivic_licao = SivicLicao.new(:nome_licao => params[:nome_licao], :user_inclusao => params[:user_inclusao], :sivic_igreja_id => params[:sivic_igreja_id], :sivic_turmamoduloprofessor_id => params[:sivic_turmamoduloprofessor_id])
    
      @sivic_turmamoduloprofessor = SivicTurmamoduloprofessor.find(params[:sivic_turmamoduloprofessor_id])

    respond_to do |format|
      if @sivic_licao.save
        format.html { redirect_to @sivic_turmamoduloprofessor, notice: 'Sivic licao was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_turmamoduloprofessor }
      else
        format.html { render action: 'show' }
        format.json { render json: @sivic_turmamoduloprofessor.errors, status: :unprocessable_entity }
      end
    end
  end

 def busca_licao

    @sivic_licao =  SivicLicao.find :all, :conditions => {:sivic_turmamoduloprofessor_id => params[:sivic_turmamoduloprofessor_id]}
    @sivic_licao_json = @sivic_licao.map {|item| {:id => item.id, :nome_licao => item.nome_licao}}
    render :json => @sivic_licao_json
  
  end


  # PATCH/PUT /sivic_licaos/1
  # PATCH/PUT /sivic_licaos/1.json
  def update
    respond_to do |format|
      if @sivic_licao.update(sivic_licao_params)
        format.html { redirect_to @sivic_licao, notice: 'Sivic licao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_licao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_licaos/1
  # DELETE /sivic_licaos/1.json
  def destroy

    @sivic_turmamoduloprofessor = SivicTurmamoduloprofessor.find(@sivic_licao.sivic_turmamoduloprofessor_id)
    @sivic_licao.destroy
    respond_to do |format|
      format.html { redirect_to @sivic_turmamoduloprofessor}
      format.json { render action: 'show', status: :created, location: @sivic_turmamoduloprofessor }
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_licao
      @sivic_licao = SivicLicao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_licao_params
      params.require(:sivic_licao).permit(:nome_licao, :user_inclusao, :sivic_igreja_id, :sivic_turmamoduloprofessor_id)
    end
end
