class SivicContabancosController < ApplicationController
  before_action :set_sivic_contabanco, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /sivic_contabancos
  # GET /sivic_contabancos.json
  def index
    @sivic_contabancos = SivicContabanco.where(sivic_igreja_id: current_user.sivic_pessoa.sivic_igreja_id)
  end

  # GET /sivic_contabancos/1
  # GET /sivic_contabancos/1.json
  def show
  end

  # GET /sivic_contabancos/new
  def new
    @sivic_contabanco = SivicContabanco.new
  end

  # GET /sivic_contabancos/1/edit
  def edit
  end

  # POST /sivic_contabancos
  # POST /sivic_contabancos.json
  def create
    @sivic_contabanco = SivicContabanco.new(sivic_contabanco_params)

    respond_to do |format|
      if @sivic_contabanco.save
        format.html { redirect_to @sivic_contabanco, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_contabanco }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_contabanco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_contabancos/1
  # PATCH/PUT /sivic_contabancos/1.json
  def update
    respond_to do |format|
      if @sivic_contabanco.update(sivic_contabanco_params)
        format.html { redirect_to @sivic_contabanco, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_contabanco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_contabancos/1
  # DELETE /sivic_contabancos/1.json
  def destroy
    @sivic_contabanco.destroy
    respond_to do |format|
      format.html { redirect_to sivic_contabancos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_contabanco
      @sivic_contabanco = SivicContabanco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_contabanco_params
      params.require(:sivic_contabanco).permit(:nome_conta, :numr_agencia, :numr_conta, :numr_dvconta, :sivic_banco_id, :sivic_igreja_id, :User, :User_id, :data_exclusao)
    end
end
