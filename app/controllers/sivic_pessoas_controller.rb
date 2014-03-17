class SivicPessoasController < ApplicationController
  before_action :set_sivic_pessoa, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def create_pessoa
    SivicPessoa.create(:father_id => params[:father_id],:NOME_pessoa => params[:NOME_pessoa],:DESC_email => params[:DESC_email],:DESC_observacao => params[:DESC_observacao],:sivic_igreja_id => params[:sivic_igreja_id])

    sivic_pessoa = SivicPessoa.find :all, :conditions => {:NOME_pessoa =>  params[:NOME_pessoa]}, :order => "NOME_pessoa ASC"
    sivic_pessoa_json = sivic_pessoa.map {|item| {:id => item.id, :NOME_pessoa => item.NOME_pessoa, :DESC_email => item.DESC_email}}
    render :json => sivic_pessoa_json
  end

  def busca_pessoa

    sivic_pessoa = SivicPessoa.where("NOME_pessoa like ?", "#{params[:NOME_pessoa]}%")
    sivic_pessoa_json = sivic_pessoa.map {|item| {:id => item.id, :NOME_pessoa => item.NOME_pessoa, :DESC_email => item.DESC_email, :father_id => item.father_id,:NOME_Lider => item.father.blank? ? '' : item.father.NOME_pessoa}}
    render :json => sivic_pessoa_json
  end

  # GET /sivic_pessoas
  # GET /sivic_pessoas.json
  def index
    #@sivic_pessoas = SivicPessoa.all
    @sivic_pessoas = SivicPessoa.paginate(:page => params[:page], :per_page => 10)
    
  end

  # GET /sivic_pessoas/1
  # GET /sivic_pessoas/1.json
  def show
  end

  # GET /sivic_pessoas/new
  def new
    @sivic_pessoa = SivicPessoa.new

    @sivic_user = User.all
    @sivic_igreja = SivicIgreja.all
  end

  # GET /sivic_pessoas/1/edit
  def edit
    @sivic_user = User.all
    @sivic_igreja = SivicIgreja.all

    @sivic_lider = SivicPessoa.find(params[:id])
    @sivic_lider = @sivic_lider.father_id   
  end

  # POST /sivic_pessoas
  # POST /sivic_pessoas.json
  def create
    @sivic_pessoa = SivicPessoa.new(sivic_pessoa_params)

    respond_to do |format|
      if @sivic_pessoa.save
        format.html { redirect_to @sivic_pessoa, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_pessoa }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_pessoas/1
  # PATCH/PUT /sivic_pessoas/1.json
  def update
    respond_to do |format|
      if @sivic_pessoa.update(sivic_pessoa_params)
        format.html { redirect_to @sivic_pessoa, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_pessoas/1
  # DELETE /sivic_pessoas/1.json
  def destroy
    @sivic_pessoa.destroy
    respond_to do |format|
      format.html { redirect_to sivic_pessoas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_pessoa
      @sivic_pessoa = SivicPessoa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_pessoa_params
      params.require(:sivic_pessoa).permit(:NOME_pessoa, :DESC_email, :DESC_observacao, :User_id, :sivic_igreja_id, :father_id)
    end
end
