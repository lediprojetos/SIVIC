class SivicFornecedorsController < ApplicationController
  before_action :set_sivic_fornecedor, only: [:show, :edit, :update, :destroy]

  # GET /sivic_fornecedors
  # GET /sivic_fornecedors.json
  def index
    @sivic_fornecedors = SivicFornecedor.where(sivic_igreja_id: current_user.sivic_pessoa.sivic_igreja_id)
  end

  # GET /sivic_fornecedors/1
  # GET /sivic_fornecedors/1.json
  def show
  end

  # GET /sivic_fornecedors/new
  def new
    @sivic_fornecedor = SivicFornecedor.new
    @sivic_fornecedor.build_sivic_endereco
  end

  # GET /sivic_fornecedors/1/edit
  def edit
  end

  # POST /sivic_fornecedors
  # POST /sivic_fornecedors.json
  def create
    @sivic_fornecedor = SivicFornecedor.new(sivic_fornecedor_params)

    respond_to do |format|
      if @sivic_fornecedor.save
        format.html { redirect_to @sivic_fornecedor, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_fornecedor }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_fornecedors/1
  # PATCH/PUT /sivic_fornecedors/1.json
  def update
    respond_to do |format|
      if @sivic_fornecedor.update(sivic_fornecedor_params)
        format.html { redirect_to @sivic_fornecedor, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_fornecedors/1
  # DELETE /sivic_fornecedors/1.json
  def destroy
    @sivic_fornecedor.destroy
    respond_to do |format|
      format.html { redirect_to sivic_fornecedors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_fornecedor
      @sivic_fornecedor = SivicFornecedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_fornecedor_params
      params.require(:sivic_fornecedor).permit(:nome_fornecedor, :numr_cnpj, :numr_cpf, :numr_telefone, :nome_responsavel, :desc_fornecedor, :sivic_igreja_id, :user_id, sivic_endereco_attributes: [ :id, :DESC_Bairro, :DESC_Rua, :DESC_Complemento, :DESC_Pontoreferencia, :NUMR_Cep, :sivic_cidade_id ])
    end
end
