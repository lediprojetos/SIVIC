class SivicLancamentosController < ApplicationController
  before_action :set_sivic_lancamento, only: [:show, :edit, :update, :destroy]


  def create_pagamento

    lastid = SivicLancamento.last.id rescue nil

    date = Date.parse(params[:data_vencimento]).to_date

    valr_lancamento = (- params[:valr_lancamento].to_i)

    if params[:chkPago] == 'True'
      flag_pago = true
    else
      flag_pago = false
    end

    if params[:numr_recorrencia] != ''


      params[:numr_recorrencia].to_i.times do

        SivicLancamento.create(:nome_lancamento => params[:nome_lancamento],:sivic_category_id => params[:sivic_category_id],:data_vencimento => date,:sivic_contabanco_id => params[:sivic_contabanco_id],:valr_lancamento => valr_lancamento,:numr_recorrencia => params[:numr_recorrencia],:data_pagamento => params[:data_pagamento],:valr_descontotaxa => params[:valr_descontotaxa],:valr_jurosmulta => params[:valr_jurosmulta],:valr_pago => params[:valr_pago],:sivic_tipmovfinanceiro_id => 1, :flag_pago => flag_pago, :sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id)

        if params[:numr_temporizador] == 'D'
          date = (date + 1.days)
        elsif params[:numr_temporizador] == 'S'
          date = (date + 1.week)
        elsif params[:numr_temporizador] == 'M'
          date = (date + 1.month)
        elsif params[:numr_temporizador] == 'B'
          date = (date + 2.month)
        elsif params[:numr_temporizador] == 'T'
          date = (date + 3.month)
        elsif params[:numr_temporizador] == 'SM'
          date = (date + 6.month)
        elsif params[:numr_temporizador] == 'A'
          date = (date + 1.year)
        end

      end 

    else
      SivicLancamento.create(:nome_lancamento => params[:nome_lancamento],:sivic_category_id => params[:sivic_category_id],:data_vencimento => date,:sivic_contabanco_id => params[:sivic_contabanco_id],:valr_lancamento => valr_lancamento,:numr_recorrencia => params[:numr_recorrencia],:data_pagamento => params[:data_pagamento],:valr_descontotaxa => params[:valr_descontotaxa],:valr_jurosmulta => params[:valr_jurosmulta],:valr_pago => params[:valr_pago],:sivic_tipmovfinanceiro_id => 1, :flag_pago => flag_pago, :sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id)
    end

    if lastid != SivicLancamento.last.id
      sivic_lancamento = SivicLancamento.find :all, :conditions => {:id => SivicLancamento.last.id}
      sivic_lancamento_json = sivic_lancamento.map {|item| {:id => item.id, :nome_lancamento => item.nome_lancamento}}
      render :json => sivic_lancamento_json
    else

    end

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
    @sivic_lancamentos = SivicLancamento.all(:conditions => {:sivic_tipmovfinanceiro_id => 1, :sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id})
    @total_lancamentos = SivicLancamento.sum(:valr_lancamento, :conditions => {:sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id})
    @total_pago = SivicLancamento.sum(:valr_lancamento, :conditions => {:flag_pago => true, :sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id})
    @a_pagar = SivicLancamento.sum(:valr_lancamento, :conditions => {:flag_pago => false, :sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id})
    #@vencidas = SivicLancamento.sum(:valr_lancamento, :conditions => {:flag_pago => false, :data_vencimento => SivicLancamento.data_vencimento.to_date < Time.now, :sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id})
    #@vencidas = SivicLancamento.sum(:valr_lancamento, :conditions => {:flag_pago => false})
    @vencidas = SivicLancamento.sum(:valr_lancamento, :conditions => ['data_vencimento < ?', Date.today])
  end

  def contasareceber
    @sivic_lancamentos = SivicLancamento.all(:conditioins => {:sivic_tipmovfinanceiro_id => 2, :sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id})
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
      format.html { redirect_to contasapagar_path }
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
      params.require(:sivic_lancamento).permit(:nome_lancamento, :valr_lancamento, :data_vencimento, :data_competencia, :flag_pago, :flag_dizimo, :numr_recorrencia, :sivic_category_id, :sivic_centrocusto_id, :sivic_rede_id, :sivic_tipmovfinanceiro_id, :sivic_pessoa_id, :sivic_fornecedor_id, :sivic_igreja_id, :user_id, :user_id, :data_exclusao, :sivic_contabanco_id, :data_pagamento_id, :valr_pago)
    end
end
