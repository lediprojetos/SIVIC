class SivicLancamentosController < ApplicationController
  before_action :set_sivic_lancamento, only: [:show, :edit, :update, :destroy]


  def create_pagamento
    SivicLancamentosController.create(:father_id => params[:father_id],:nome_pessoa => params[:nome_pessoa],:DESC_email => params[:DESC_email],:DESC_observacao => params[:DESC_observacao],:sivic_igreja_id => params[:sivic_igreja_id])

    sivic_pessoa = SivicPessoa.find :all, :conditions => {:nome_pessoa =>  params[:nome_pessoa]}, :order => "nome_pessoa ASC"
    sivic_pessoa_json = sivic_pessoa.map {|item| {:id => item.id, :nome_pessoa => item.nome_pessoa, :DESC_email => item.DESC_email}}
    render :json => sivic_pessoa_json
  end

  # GET /sivic_lancamentos
  # GET /sivic_lancamentos.json
  def index
    @sivic_lancamentos = SivicLancamento.all
  end

  # GET /sivic_lancamentos/new
  def new
    @sivic_lancamento = SivicLancamento.new
  end

  def contasapagar
    @sivic_lancamentos = SivicLancamento.where("sivic_tipmovfinanceiro_id  = 1")
  end  

  def contasareceber
    @sivic_lancamentos = SivicLancamento.where("sivic_tipmovfinanceiro_id  = 2")
  end    

  def extrato
    @sivic_lancamentos = SivicLancamento.all
  end      


  # GET /sivic_lancamentos/1
  # GET /sivic_lancamentos/1.json
  def show
  end

  # GET /sivic_lancamentos/1/edit
  def edit
  end

  # POST /sivic_lancamentos
  # POST /sivic_lancamentos.json
  def create
    @sivic_lancamento = SivicLancamento.new(sivic_lancamento_params)

    respond_to do |format|
      if @sivic_lancamento.save
        format.html { redirect_to @sivic_lancamento, notice: 'Sivic lancamento was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_lancamento }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_lancamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_lancamentos/1
  # PATCH/PUT /sivic_lancamentos/1.json
  def update
    respond_to do |format|
      if @sivic_lancamento.update(sivic_lancamento_params)
        format.html { redirect_to @sivic_lancamento, notice: 'Sivic lancamento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_lancamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_lancamentos/1
  # DELETE /sivic_lancamentos/1.json
  def destroy
    @sivic_lancamento.destroy
    respond_to do |format|
      format.html { redirect_to sivic_lancamentos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_lancamento
      @sivic_lancamento = SivicLancamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_lancamento_params
      params.require(:sivic_lancamento).permit(:nome_lancamento, :valr_lancamento, :data_vencimento, :data_competencia, :flag_pago, :flag_dizimo, :numr_recorrencia, :sivic_category_id, :sivic_centrocusto_id, :sivic_rede_id, :sivic_tipmovfinanceiro_id, :sivic_pessoa_id, :sivic_fornecedor_id, :sivic_igreja_id, :user_id, :user_id, :data_exclusao)
    end
end
