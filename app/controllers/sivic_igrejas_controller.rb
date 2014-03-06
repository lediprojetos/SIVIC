class SivicIgrejasController < ApplicationController
  before_action :set_sivic_igreja, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!

  # GET /sivic_igrejas
  # GET /sivic_igrejas.json
  def index
    @sivic_igrejas = SivicIgreja.paginate(:page => params[:page], :per_page => 10)

  end

  # GET /sivic_igrejas/1
  # GET /sivic_igrejas/1.json
  def show
  end

  # GET /sivic_igrejas/new
  def new
    @sivic_igreja = SivicIgreja.new
    @sivic_igreja.build_sivic_endereco
  end


  # GET /sivic_igrejas/1/edit
  def edit
    @sivic_estado = SivicIgreja.find(params[:id])
    @sivic_estado = @sivic_estado.sivic_endereco.sivic_cidade.sivic_estado.id

    @sivic_cidade = SivicCidade.find :all, :conditions => {:sivic_estado_id => @sivic_estado}

    @sivic_cidade_setada = SivicIgreja.find(params[:id])
    @sivic_cidade_setada = @sivic_cidade_setada.sivic_endereco.sivic_cidade.id

    @sivic_sede = SivicIgreja.find(params[:id])
    @sivic_sede = @sivic_sede.father_id
  end

  # POST /sivic_igrejas
  # POST /sivic_igrejas.json
  def create

    @sivic_igreja = SivicIgreja.new(sivic_igreja_params)

    respond_to do |format|
      if @sivic_igreja.save
        format.html { redirect_to @sivic_igreja, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_igreja }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_igreja.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /sivic_igrejas/1
  # PATCH/PUT /sivic_igrejas/1.json
  def update
    respond_to do |format|
      if @sivic_igreja.update(sivic_igreja_params)
        format.html { redirect_to @sivic_igreja, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_igreja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_igrejas/1
  # DELETE /sivic_igrejas/1.json
  def destroy
    @sivic_igreja.destroy
    respond_to do |format|
      format.html { redirect_to sivic_igrejas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_igreja
      @sivic_igreja = SivicIgreja.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_igreja_params
      params.require(:sivic_igreja).permit(:father_id, :NOME_igreja, :NUMR_telefone, :NOME_responsavel, :NUMR_cnpj, sivic_endereco_attributes: [ :id, :DESC_Bairro, :DESC_Rua, :DESC_Complemento, :DESC_Pontoreferencia, :NUMR_Cep, :sivic_cidade_id ])
    end
end
