class SivicBancosController < ApplicationController
  before_action :set_sivic_banco, only: [:show, :edit, :update, :destroy]

  # GET /sivic_bancos
  # GET /sivic_bancos.json
  def index
    @sivic_bancos = SivicBanco.all
  end

  # GET /sivic_bancos/1
  # GET /sivic_bancos/1.json
  def show
  end

  # GET /sivic_bancos/new
  def new
    @sivic_banco = SivicBanco.new
  end

  # GET /sivic_bancos/1/edit
  def edit
  end

  # POST /sivic_bancos
  # POST /sivic_bancos.json
  def create
    @sivic_banco = SivicBanco.new(sivic_banco_params)

    respond_to do |format|
      if @sivic_banco.save
        format.html { redirect_to @sivic_banco, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_banco }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_bancos/1
  # PATCH/PUT /sivic_bancos/1.json
  def update
    respond_to do |format|
      if @sivic_banco.update(sivic_banco_params)
        format.html { redirect_to @sivic_banco, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_bancos/1
  # DELETE /sivic_bancos/1.json
  def destroy
    @sivic_banco.destroy
    respond_to do |format|
      format.html { redirect_to sivic_bancos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_banco
      @sivic_banco = SivicBanco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_banco_params
      params.require(:sivic_banco).permit(:nome_banco, :numr_codigo)
    end
end
