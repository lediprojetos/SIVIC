class ObservacoesrelatoriosController < ApplicationController
  before_action :set_observacoesrelatorio, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def create_observacao

    Observacoesrelatorio.create(:sivic_relatorioscelula_id => params[:sivic_relatorioscelula_id],:sivic_pessoa_id => params[:sivic_pessoa_id],:DESC_Observacao => params[:DESC_Observacao])

    sivic_observacao = Observacoesrelatorio.find :all, :conditions => {:sivic_relatorioscelula_id => params[:sivic_relatorioscelula_id],:sivic_pessoa_id => params[:sivic_pessoa_id],:DESC_Observacao => params[:DESC_Observacao]}
    sivic_observacao_json = sivic_observacao.map {|item| {:sivic_relatorioscelula_id => item.sivic_relatorioscelula_id, :nome_pessoa => item.sivic_pessoa.nome_pessoa, :DESC_Observacao => item.DESC_Observacao}}
    render :json => sivic_observacao_json    

  end

  # GET /observacoesrelatorios
  # GET /observacoesrelatorios.json
  def index
    @observacoesrelatorios = Observacoesrelatorio.all
  end

  # GET /observacoesrelatorios/1
  # GET /observacoesrelatorios/1.json
  def show
  end

  # GET /observacoesrelatorios/new
  def new
    @observacoesrelatorio = Observacoesrelatorio.new
  end

  # GET /observacoesrelatorios/1/edit
  def edit
  end

  # POST /observacoesrelatorios
  # POST /observacoesrelatorios.json
  def create
    @observacoesrelatorio = Observacoesrelatorio.new(observacoesrelatorio_params)

    respond_to do |format|
      if @observacoesrelatorio.save
        format.html { redirect_to @observacoesrelatorio, notice: 'Observacoesrelatorio was successfully created.' }
        format.json { render action: 'show', status: :created, location: @observacoesrelatorio }
      else
        format.html { render action: 'new' }
        format.json { render json: @observacoesrelatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /observacoesrelatorios/1
  # PATCH/PUT /observacoesrelatorios/1.json
  def update
    respond_to do |format|
      if @observacoesrelatorio.update(observacoesrelatorio_params)
        format.html { redirect_to @observacoesrelatorio, notice: 'Observacoesrelatorio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @observacoesrelatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observacoesrelatorios/1
  # DELETE /observacoesrelatorios/1.json
  def destroy
    @observacoesrelatorio.destroy
    respond_to do |format|
      format.html { redirect_to observacoesrelatorios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_observacoesrelatorio
      @observacoesrelatorio = Observacoesrelatorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def observacoesrelatorio_params
      params.require(:observacoesrelatorio).permit(:sivic_relatorioscelulas_id, :sivic_pessoas_id, :DESC_Observacao)
    end
end
