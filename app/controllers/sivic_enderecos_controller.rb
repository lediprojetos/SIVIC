class SivicEnderecosController < ApplicationController
  before_action :set_sivic_endereco, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sivic_enderecos
  # GET /sivic_enderecos.json
  def index
    @sivic_enderecos = SivicEndereco.all
  end

  # GET /sivic_enderecos/1
  # GET /sivic_enderecos/1.json
  def show
    
  end

  # GET /sivic_enderecos/new
  def new
    @sivic_endereco = SivicEndereco.new
  end

  # GET /sivic_enderecos/1/edit
  def edit
  end

  # AJAX /criarEndereco
  def create_endereco
    id = SivicEndereco.create(:DESC_Bairro, :DESC_Rua, :DESC_Complemento, :DESC_Pontoreferencia, :NUMR_Cep, :sivic_cidade_id)

    sivic_endereco = SivicEndereco.find :all, :conditions => {:id => id}
    sivic_endereco_json = sivic_endereco.map {|item| {:id => item.id, :DESC_Bairro => item.DESC_Bairro, :DESC_Rua => item.DESC_Rua, :DESC_Complemento => item.DESC_Complemento, :DESC_Pontoreferencia => item.DESC_Pontoreferencia, :NUMR_Cep => item.NUMR_Cep, :sivic_cidade_id => item.sivic_cidade_id, :nome_cidade => item.sivic_cidade.nome_cidade}}
    render :json => sivic_endereco_json
  end

  # AJAX /
  def busca_endereco

    sivic_pessoa = SivicPessoa.where("NOME_pessoa like ?", "#{params[:NOME_pessoa]}%")
    sivic_pessoa_json = sivic_pessoa.map {|item| {:id => item.id, :NOME_pessoa => item.NOME_pessoa, :DESC_email => item.DESC_email, :father_id => item.father_id, :NOME_Lider => item.father.NOME_pessoa }}
    render :json => sivic_pessoa_json
  end   

  # POST /sivic_enderecos
  # POST /sivic_enderecos.json
  def create
    @sivic_endereco = SivicEndereco.new(sivic_endereco_params)

    respond_to do |format|
      if @sivic_endereco.save
        format.html { redirect_to @sivic_endereco, notice: 'Sivic endereco was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_endereco }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_enderecos/1
  # PATCH/PUT /sivic_enderecos/1.json
  def update
    respond_to do |format|
      if @sivic_endereco.update(sivic_endereco_params)
        format.html { redirect_to @sivic_endereco, notice: 'Sivic endereco was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_enderecos/1
  # DELETE /sivic_enderecos/1.json
  def destroy
    @sivic_endereco.destroy
    respond_to do |format|
      format.html { redirect_to sivic_enderecos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_endereco
      @sivic_endereco = SivicEndereco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_endereco_params
      params.require(:sivic_endereco).permit(:DESC_Bairro, :DESC_Rua, :DESC_Complemento, :DESC_Pontoreferencia, :NUMR_Cep, :sivic_cidade_id)
    end
end
