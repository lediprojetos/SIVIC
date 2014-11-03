class SivicNotaalunosController < ApplicationController
  before_action :set_sivic_notaaluno, only: [:show, :edit, :destroy]

  # GET /sivic_notaalunos
  # GET /sivic_notaalunos.json
  def index
    @sivic_notaalunos = SivicNotaaluno.all
  end

  # GET /sivic_notaalunos/1
  # GET /sivic_notaalunos/1.json
  def show
  end

  # GET /sivic_notaalunos/new
  def new
    @sivic_notaaluno = SivicNotaaluno.new
  end

  # GET /sivic_notaalunos/1/edit
  def edit
  end

  def licaonota

    @sivic_licao = SivicLicao.find :all, :conditions => {sivic_turmamoduloprofessor_id: params[:id]}


  end

  def notaaluno

     @sivic_notaaluno = SivicNotaaluno.find :all, :conditions => {sivic_licao_id: params[:id]}
     @sivic_licao = SivicLicao.find(params[:id])
     
  
  end

  def busca_aluno_nota
        @sivic_alunosaula = SivicAlunoaula.find :all, :conditions => {:sivic_aula_id => params[:sivic_aula_id]}
        @sivic_alunosaula_json = @sivic_alunosaula.map {|item| {:id => item.id, :nome_pessoa => item.sivic_turmaaluno.sivic_pessoa.nome_pessoa, :flag_ausente =>item.flag_ausente}}
        render :json => @sivic_alunosaula_json 
  end

  def busca_nota_aluno
      @sivic_notaaluno = SivicNotaaluno.find :all, :conditions => {sivic_licao_id: params[:sivic_licao_id]}
      @sivic_notaaluno_json = @sivic_notaaluno.map{|item|{:id=> item.id, :nota => item.nota, :nome_pessoa => item.sivic_turmaaluno.sivic_pessoa.nome_pessoa}}
      render :json =>  @sivic_notaaluno_json
  end

  # POST /sivic_notaalunos
  # POST /sivic_notaalunos.json
  def create
    @sivic_notaaluno = SivicNotaaluno.new(sivic_notaaluno_params)

    respond_to do |format|
      if @sivic_notaaluno.save
        format.html { redirect_to @sivic_notaaluno, notice: 'Sivic notaaluno was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_notaaluno }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_notaaluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_notaalunos/1
  # PATCH/PUT /sivic_notaalunos/1.json
  def update
    
   @sivic_notaaluno = SivicNotaaluno.find :all, :conditions => {sivic_licao_id: params[:id]}
   @sivic_licao_id = params[:id]

   @notas = params[:nota]

    @cont = 0
     @sivic_notaaluno.each do |notaaluno|
         @notas.each_with_index do |nota, indice|
            if indice == @cont                
                @notaaluno = SivicNotaaluno.find(notaaluno.id)
                @notaaluno.nota = nota
                @notaaluno.save 
            end
        end
       @cont = @cont + 1
     end
      
      respond_to do |format|

      format.html { redirect_to notaaluno_sivic_notaaluno_path(@sivic_licao_id), notice: 'Sivic notaaluno was successfully updated.' }
      format.json { head :no_content }

      end


  end


  # DELETE /sivic_notaalunos/1
  # DELETE /sivic_notaalunos/1.json
  def destroy
    @sivic_notaaluno.destroy
    respond_to do |format|
      format.html { redirect_to sivic_notaalunos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_notaaluno
      @sivic_notaaluno = SivicNotaaluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_notaaluno_params
      params.require(:sivic_notaaluno).permit(:nota, :sivic_licao_id, :sivic_turmaaluno_id, :user_inclusao)
    end
end
