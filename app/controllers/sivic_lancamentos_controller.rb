class SivicLancamentosController < ApplicationController
  before_action :set_sivic_lancamento, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

include ActionView::Helpers::NumberHelper

def edita_dizimo

  #Tratando valores numéricos
  params[:valr_pago] = params[:valr_pago].gsub('R$', '')
  params[:valr_pago] = params[:valr_pago].gsub('.', '')
  params[:valr_pago] = params[:valr_pago].gsub(',', '.').to_f

  #Definindo Origem e destino
  objDizimo = SivicLancamento.find_by_id(params[:id])

  #Origem
  objDizimo.sivic_contabanco_id = params[:sivic_contabanco_id]
  objDizimo.data_pagamento = params[:data_pagamento]
  objDizimo.data_vencimento = params[:data_pagamento]
  objDizimo.valr_lancamento = params[:valr_pago]
  objDizimo.valr_pago = params[:valr_pago]
  objDizimo.sivic_pessoa_id = params[:sivic_pessoa_id]
  objDizimo.sivic_igreja_id = current_user.sivic_pessoa.sivic_igreja_id
  objDizimo.save

      sivic_lancamento = SivicLancamento.find :all, :conditions => {:id => params[:id]}
      sivic_lancamento_json = sivic_lancamento.map {|item| {:id => item.id, :nome_lancamento => item.nome_lancamento}}
      render :json => sivic_lancamento_json  

end

def busca_dizimo

      sivic_lancamento = SivicLancamento.find :all, :conditions => {:id => params[:id]}
      sivic_lancamento_json = sivic_lancamento.map {|item| {
                                                        :id => item.id, 
                                                        :valr_lancamento =>number_to_currency( item.valr_lancamento, unit: "R$", separator: ",", delimiter: "."),
                                                        :sivic_contabanco_id => item.sivic_contabanco_id,
                                                        :data_pagamento => (item.data_pagamento.blank? ? '' : item.data_pagamento.strftime("%d/%m/%Y")),
                                                        :valr_pago => number_to_currency( item.valr_pago, unit: "R$", separator: ",", delimiter: "."),
                                                        :sivic_pessoa_id => item.sivic_pessoa_id,
                                                        :nome_pessoa => item.sivic_pessoa.nome_pessoa}
                                                           }
      render :json => sivic_lancamento_json

end

def create_dizimo

  #Tratando valores numéricos
  params[:valr_pago] = params[:valr_pago].gsub('.', '')
  params[:valr_pago] = params[:valr_pago].gsub(',', '.').to_f

  objDizimo = SivicLancamento.new

  objDizimo.nome_lancamento = 'Dizimo'
  objDizimo.sivic_contabanco_id = params[:sivic_contabanco_id]
  objDizimo.data_pagamento = params[:data_pagamento]
  objDizimo.data_vencimento = params[:data_pagamento]
  objDizimo.valr_lancamento = params[:valr_pago]
  objDizimo.valr_pago = params[:valr_pago]

  @categoria = SivicCategory.find  :all, :conditions =>{:sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id, :numr_codigo => 1}

  objDizimo.sivic_tipmovfinanceiro_id = 2
  objDizimo.sivic_category_id = @categoria.first.id
  objDizimo.flag_pago = true
  objDizimo.sivic_pessoa_id = params[:sivic_pessoa_id]
  objDizimo.sivic_igreja_id = current_user.sivic_pessoa.sivic_igreja_id

  objDizimo.save

  sivic_lancamento = SivicLancamento.find :all, :conditions => {:id => objDizimo.id}
  sivic_lancamento_json = sivic_lancamento.map {|item| {:id => item.id}}
  render :json => sivic_lancamento_json

end



def deleta_transferencia

  objTransferencia_ori = SivicLancamento.where('valr_pago < 0 and codi_parcela = ?', params[:codi_parcela])
  objTransferencia_des = SivicLancamento.where('valr_pago > 0 and codi_parcela = ?', params[:codi_parcela])

  objTransferencia_ori.first.data_exclusao = Date.today
  objTransferencia_ori.first.user_exclusao = current_user.sivic_pessoa_id
  objTransferencia_des.first.data_exclusao = Date.today
  objTransferencia_des.first.user_exclusao = current_user.sivic_pessoa_id

  objTransferencia_ori.first.save
  objTransferencia_des.first.save

    sivic_lancamento_json = objTransferencia_des.map {|item| {:id => item.id}}
    render :json => sivic_lancamento_json

end

def busca_transferencia

  objTransferencia_ori = SivicLancamento.where('valr_pago < 0 and codi_parcela = ?', params[:codi_parcela])
  objTransferencia_des = SivicLancamento.where('valr_pago > 0 and codi_parcela = ?', params[:codi_parcela])


      sivic_lancamento_json = objTransferencia_ori.map {|item| {
                                                        :id => item.id, 
                                                        :codi_parcela => item.codi_parcela, 
                                                        :nome_lancamento => item.nome_lancamento,
                                                        :valr_lancamento =>number_to_currency( item.valr_lancamento, unit: "R$", separator: ",", delimiter: "."),
                                                        :data_vencimento => (item.data_vencimento.blank? ? '' : item.data_vencimento.strftime("%d/%m/%Y")),
                                                        :flag_pago => item.flag_pago,
                                                        :sivic_category_id => item.sivic_category_id,
                                                        :sivic_contabanco_id_ori => item.sivic_contabanco_id,
                                                        :sivic_contabanco_id_des => objTransferencia_des.first.sivic_contabanco_id,
                                                        :data_pagamento => (item.data_pagamento.blank? ? '' : item.data_pagamento.strftime("%d/%m/%Y")),
                                                        :valr_pago => number_to_currency( item.valr_pago, unit: "R$", separator: ",", delimiter: "."),
                                                        :valr_jurosmulta => number_to_currency( item.valr_jurosmulta, unit: "R$", separator: ",", delimiter: "."),
                                                        :valr_descontotaxa => number_to_currency( item.valr_descontotaxa, unit: "R$", separator: ",", delimiter: ".")}
                                                           }
      render :json => sivic_lancamento_json

end

def edita_transferencia

  #Tratando valores numéricos
  params[:valr_pago] = params[:valr_pago].gsub('R$', '')
  params[:valr_pago] = params[:valr_pago].gsub('.', '')
  params[:valr_pago] = params[:valr_pago].gsub(',', '.').to_f

  #Definindo Origem e destino
  objTransferencia_ori = SivicLancamento.where('valr_pago < 0 and codi_parcela = ?', params[:codi_parcela])
  objTransferencia_des = SivicLancamento.where('valr_pago > 0 and codi_parcela = ?', params[:codi_parcela])

    #Origem
    objTransferencia_ori.first.nome_lancamento = params[:nome_lancamento]
    objTransferencia_ori.first.sivic_contabanco_id = params[:sivic_contabanco_ori_id]
    objTransferencia_ori.first.data_pagamento = params[:data_pagamento]
    objTransferencia_ori.first.data_vencimento = params[:data_pagamento]
    objTransferencia_ori.first.valr_lancamento = (-params[:valr_pago])
    objTransferencia_ori.first.valr_pago = (-params[:valr_pago])
    objTransferencia_ori.first.save

    #Destino
    objTransferencia_des.first.nome_lancamento = params[:nome_lancamento]
    objTransferencia_des.first.sivic_contabanco_id = params[:sivic_contabanco_des_id]
    objTransferencia_des.first.data_pagamento = params[:data_pagamento]
    objTransferencia_des.first.data_vencimento = params[:data_pagamento]
    objTransferencia_des.first.valr_lancamento = params[:valr_pago]
    objTransferencia_des.first.valr_pago = params[:valr_pago]
    objTransferencia_des.first.save  

      #sivic_lancamento = SivicLancamento.find :all, :conditions => {:id => params[:id]}
      sivic_lancamento_json = objTransferencia_des.map {|item| {:id => item.id, :nome_lancamento => item.nome_lancamento}}
      render :json => sivic_lancamento_json  

end


def create_transferencia

  #Tratando valores numéricos
  params[:valr_pago] = params[:valr_pago].gsub('.', '')
  params[:valr_pago] = params[:valr_pago].gsub(',', '.').to_f

  objTransferencia = SivicLancamento.new

  objTransferencia.nome_lancamento = params[:nome_lancamento]
  objTransferencia.sivic_contabanco_id = params[:sivic_contabanco_ori_id]
  objTransferencia.data_pagamento = params[:data_pagamento]
  objTransferencia.data_vencimento = params[:data_pagamento]
  objTransferencia.valr_lancamento = (-params[:valr_pago])
  objTransferencia.valr_pago = (-params[:valr_pago])
  objTransferencia.sivic_tipmovfinanceiro_id = 3
  objTransferencia.flag_pago = true
  objTransferencia.sivic_igreja_id = current_user.sivic_pessoa.sivic_igreja_id
  objTransferencia.save
  objTransferencia.codi_parcela = objTransferencia.id
  objTransferencia.save

  objTransferencia2 = SivicLancamento.new

  objTransferencia2.nome_lancamento = params[:nome_lancamento]
  objTransferencia2.sivic_contabanco_id = params[:sivic_contabanco_des_id]
  objTransferencia2.data_vencimento = params[:data_pagamento]
  objTransferencia2.data_pagamento = params[:data_pagamento]
  objTransferencia2.valr_lancamento = params[:valr_pago]
  objTransferencia2.valr_pago = params[:valr_pago]
  objTransferencia2.sivic_tipmovfinanceiro_id = 3
  objTransferencia2.flag_pago = true
  objTransferencia2.sivic_igreja_id = current_user.sivic_pessoa.sivic_igreja_id
  objTransferencia2.codi_parcela = objTransferencia.id

  objTransferencia2.save    

  sivic_lancamento = SivicLancamento.find :all, :conditions => {:id => objTransferencia2.id}
  sivic_lancamento_json = sivic_lancamento.map {|item| {:id => item.id}}
  render :json => sivic_lancamento_json

end

def seta_periodo
  if params[:tempo] == 'hoje'
    #Hoje
    session[:data_ini] = Date.today  
    session[:data_fim] = Date.today
  elsif params[:tempo] == 'semana'
    #Esta Semana
    session[:data_ini] = Date.today
    session[:data_fim] = Date.today
    session[:data_ini] = session[:data_ini].at_beginning_of_week.strftime
    session[:data_fim] = session[:data_fim].at_end_of_week.strftime
  elsif params[:tempo] == 'mes'
    #Esta Mês
    session[:data_ini] = Date.today
    session[:data_fim] = Date.today
    session[:data_ini] = session[:data_ini].at_beginning_of_month.strftime
    session[:data_fim] = session[:data_fim].at_end_of_month.strftime  
  elsif params[:tempo] == '30dias'
    #Últimos 30 Dias
    session[:data_ini] = (Time.now - 1.month)
    session[:data_fim] = Date.today
  elsif params[:tempo] == 'custom'
    #Customizado

  #Tratando datas inválidas vindas da view
  begin
     Date.parse(params[:data_ini])
     session[:data_ini] = params[:data_ini]
  rescue ArgumentError
    session[:data_ini] = Date.today
    session[:data_fim] = Date.today
    session[:data_ini] = session[:data_ini].at_beginning_of_month.strftime
    session[:data_fim] = session[:data_fim].at_end_of_month.strftime 
  end

  #Tratando datas inválidas vindas da view
  begin
     Date.parse(params[:data_fim])
     session[:data_fim] = params[:data_fim]
  rescue ArgumentError
    session[:data_ini] = Date.today
    session[:data_fim] = Date.today
    session[:data_ini] = session[:data_ini].at_beginning_of_month.strftime
    session[:data_fim] = session[:data_fim].at_end_of_month.strftime 
  end  
    
  end

  respond_to do |format|
    format.html { redirect_to contasapagar_path}
  end
end

def deleta_lancamento

    @lancamento = SivicLancamento.find_by_id(params[:id])

    @lancamento.update(
                      :data_exclusao => Date.today,
                      :user_exclusao => current_user.sivic_pessoa_id
                      )


    sivic_lancamento = SivicLancamento.find :all, :conditions => {:id => params[:id]}
    sivic_lancamento_json = sivic_lancamento.map {|item| {:id => item.id, :nome_lancamento => item.nome_lancamento, :flag_pago => item.flag_pago}}
    render :json => sivic_lancamento_json

end

def edita_pagaRecebe

    @lancamento = SivicLancamento.find_by_id(params[:id])

    if params[:flag_pago] == 'True'
      flag_pago = true
      valor_pago = @lancamento.valr_lancamento.to_f
    else
      flag_pago = false
      valor_pago = 0.0
    end


    @lancamento.update(
                      :data_pagamento => Date.today,
                      :valr_pago => valor_pago,
                      :flag_pago => flag_pago
                      )

    sivic_lancamento = SivicLancamento.find :all, :conditions => {:id => params[:id]}
    sivic_lancamento_json = sivic_lancamento.map {|item| {:id => item.id, :nome_lancamento => item.nome_lancamento, :flag_pago => item.flag_pago}}
    render :json => sivic_lancamento_json

end

def busca_lancamento

      sivic_lancamento = SivicLancamento.find :all, :conditions => {:id => params[:id]}
      sivic_lancamento_json = sivic_lancamento.map {|item| {
                                                        :id => item.id, 
                                                        :nome_lancamento => item.nome_lancamento,
                                                        :valr_lancamento =>number_to_currency( item.valr_lancamento, unit: "R$", separator: ",", delimiter: "."),
                                                        :data_vencimento => (item.data_vencimento.blank? ? '' : item.data_vencimento.strftime("%d/%m/%Y")),
                                                        :flag_pago => item.flag_pago,
                                                        :sivic_category_id => item.sivic_category_id,
                                                        :sivic_contabanco_id => item.sivic_contabanco_id,
                                                        :data_pagamento => (item.data_pagamento.blank? ? '' : item.data_pagamento.strftime("%d/%m/%Y")),
                                                        :valr_pago => number_to_currency( item.valr_pago, unit: "R$", separator: ",", delimiter: "."),
                                                        :valr_jurosmulta => number_to_currency( item.valr_jurosmulta, unit: "R$", separator: ",", delimiter: "."),
                                                        :valr_descontotaxa => number_to_currency( item.valr_descontotaxa, unit: "R$", separator: ",", delimiter: ".")}
                                                           }
      render :json => sivic_lancamento_json

end

  def create_pagamento

    params[:valr_lancamento] = params[:valr_lancamento].gsub('.', '')
    params[:valr_descontotaxa] = params[:valr_descontotaxa].gsub('.', '')
    params[:valr_jurosmulta] = params[:valr_jurosmulta].gsub('.', '')
    params[:valr_pago] = params[:valr_pago].gsub('.', '')

    params[:valr_descontotaxa] = params[:valr_descontotaxa].gsub(',', '.')
    params[:valr_jurosmulta] = params[:valr_jurosmulta].gsub(',', '.')
    
    if params[:sivic_tipmovfinanceiro_id] == 'D'
      params[:sivic_tipmovfinanceiro_id] = 1
      #se for Despesas recebe valor negativo
      params[:valr_pago] = ( - params[:valr_pago].gsub(',', '.').to_f)
      params[:valr_lancamento] = ( - params[:valr_lancamento].gsub(',', '.').to_f)
    elsif params[:sivic_tipmovfinanceiro_id] == 'R'
      params[:sivic_tipmovfinanceiro_id] = 2
      #se for Despesas recebe valor positivo
      params[:valr_pago] = params[:valr_pago].gsub(',', '.').to_f
      params[:valr_lancamento] = params[:valr_lancamento].gsub(',', '.').to_f
    end

    date = Date.parse(params[:data_vencimento]).to_date

    parcela = 1

    if params[:chkPago] == 'True'
      flag_pago = true
    else
      flag_pago = false
    end

    if params[:numr_recorrencia] != ''


      params[:numr_recorrencia].to_i.times do

        SivicLancamento.create(
                                :nome_lancamento => params[:nome_lancamento],
                                :sivic_category_id => params[:sivic_category_id],
                                :data_vencimento => date,
                                :sivic_contabanco_id => params[:sivic_contabanco_id],
                                :valr_lancamento => params[:valr_lancamento],
                                :numr_recorrencia => params[:numr_recorrencia],
                                :numr_parcela => parcela,
                                :data_pagamento => params[:data_pagamento],
                                :valr_descontotaxa => params[:valr_descontotaxa],
                                :valr_jurosmulta => params[:valr_jurosmulta],
                                :valr_pago => params[:valr_pago],
                                :sivic_tipmovfinanceiro_id => params[:sivic_tipmovfinanceiro_id],
                                :flag_pago => flag_pago,
                                :sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id
                              )

        parcela = parcela + 1

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
      SivicLancamento.create(:nome_lancamento => params[:nome_lancamento],
                             :sivic_category_id => params[:sivic_category_id],
                             :data_vencimento => date,
                             :sivic_contabanco_id => params[:sivic_contabanco_id],
                             :valr_lancamento => params[:valr_lancamento],
                             :numr_recorrencia => params[:numr_recorrencia],
                             :data_pagamento => params[:data_pagamento],
                             :valr_descontotaxa => params[:valr_descontotaxa],
                             :valr_jurosmulta => params[:valr_jurosmulta],
                             :valr_pago => params[:valr_pago],
                             :sivic_tipmovfinanceiro_id => params[:sivic_tipmovfinanceiro_id], 
                             :flag_pago => flag_pago, 
                             :sivic_igreja_id => current_user.sivic_pessoa.sivic_igreja_id)
    end

      sivic_lancamento = SivicLancamento.find :all, :conditions => {:id => SivicLancamento.last.id}
      sivic_lancamento_json = sivic_lancamento.map {|item| {:id => item.id, :nome_lancamento => item.nome_lancamento}}
      render :json => sivic_lancamento_json

  end

  def edita_pagamento

    @lancamento = SivicLancamento.find_by_id(params[:id])

    date = Date.parse(params[:data_vencimento]).to_date

    params[:valr_lancamento] = params[:valr_lancamento].gsub('R$', '')
    params[:valr_descontotaxa] = params[:valr_descontotaxa].gsub('R$', '')
    params[:valr_jurosmulta] = params[:valr_jurosmulta].gsub('R$', '')
    params[:valr_pago] = params[:valr_pago].gsub('R$', '')

    params[:valr_lancamento] = params[:valr_lancamento].gsub('.', '')
    params[:valr_descontotaxa] = params[:valr_descontotaxa].gsub('.', '')
    params[:valr_jurosmulta] = params[:valr_jurosmulta].gsub('.', '')
    params[:valr_pago] = params[:valr_pago].gsub('.', '')

    params[:valr_descontotaxa] = params[:valr_descontotaxa].gsub(',', '.')
    params[:valr_jurosmulta] = params[:valr_jurosmulta].gsub(',', '.')
    
    if @lancamento.sivic_tipmovfinanceiro_id == 1
      params[:valr_lancamento] = ( - params[:valr_lancamento].gsub(',', '.').to_f)
      params[:valr_pago] = ( - params[:valr_pago].gsub(',', '.').to_f)
    elsif @lancamento.sivic_tipmovfinanceiro_id == 2
      params[:valr_lancamento] = params[:valr_lancamento].gsub(',', '.').to_f
      params[:valr_pago] = params[:valr_pago].gsub(',', '.').to_f
    end

    if params[:chkPago] == 'True'
      flag_pago = true
    else
      flag_pago = false
      params[:valr_pago] = '0.0'
      params[:valr_jurosmulta] = '0.0'
      params[:data_pagamento] = '0.0'
      params[:valr_descontotaxa] = '0.0'
    end


      @lancamento.update(
                        :nome_lancamento => params[:nome_lancamento],
                        :sivic_category_id => params[:sivic_category_id],
                        :data_vencimento => date,
                        :sivic_contabanco_id => params[:sivic_contabanco_id],
                        :valr_lancamento => params[:valr_lancamento],
                        :data_pagamento => params[:data_pagamento],
                        :valr_descontotaxa => params[:valr_descontotaxa],
                        :valr_jurosmulta => params[:valr_jurosmulta],
                        :valr_pago => params[:valr_pago],
                        :flag_pago => flag_pago
                        )

      sivic_lancamento = SivicLancamento.find :all, :conditions => {:id => params[:id]}
      sivic_lancamento_json = sivic_lancamento.map {|item| {:id => item.id, :nome_lancamento => item.nome_lancamento}}
      render :json => sivic_lancamento_json

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
    @sivic_lancamentos = find_by_ContasPagar.order(:data_vencimento)
    @total_lancamentos = find_by_ContasPagar.sum(:valr_lancamento)
    @total_pago = find_by_ContasPagar.sum(:valr_pago, :conditions => {:flag_pago => true})
    @a_pagar = find_by_ContasPagar.sum(:valr_lancamento, :conditions => {:flag_pago => false})
    @vencidas = find_by_ContasPagar.sum(:valr_lancamento, :conditions => ['data_vencimento < ? and flag_pago = False', Date.today])
  end

  def contasareceber
    @sivic_lancamentos = find_by_ContasReceber.order(:data_vencimento)
    @total_lancamentos = find_by_ContasReceber.sum(:valr_lancamento)
    @total_pago = find_by_ContasReceber.sum(:valr_pago, :conditions => {:flag_pago => true})
    @a_pagar = find_by_ContasReceber.sum(:valr_lancamento, :conditions => {:flag_pago => false})
    @vencidas = find_by_ContasReceber.sum(:valr_lancamento, :conditions => ['data_vencimento < ? and flag_pago = False', Date.today])
  end

  def extrato
    @sivic_lancamentos = find_by_Extrato.order(:data_vencimento)
    
    @total_recebimento = find_by_ContasReceber.sum(:valr_pago, :conditions => {:flag_pago => true})
    @total_pagamento = find_by_ContasPagar.sum(:valr_pago, :conditions => {:flag_pago => true})
    @total_periodo = find_by_Extrato.sum(:valr_pago)
  end

  def extrato_mensal

  @mes = params[:mes]

  if not params[:mes] == nil
    session[:data_ini] = Date.today.change(month: params[:mes].to_i).at_beginning_of_month.strftime
    session[:data_fim] = Date.today.change(month: params[:mes].to_i).at_end_of_month.strftime

    #session[:data_ini] = session[:data_ini].at_beginning_of_month.strftime
    #session[:data_fim] = session[:data_fim].at_end_of_month.strftime     
  end

    @sivic_lancamentos = find_by_Extrato.order(:data_vencimento)
    
    @total_recebimento = find_by_ContasReceber.sum(:valr_pago, :conditions => {:flag_pago => true})
    @total_pagamento = find_by_ContasPagar.sum(:valr_pago, :conditions => {:flag_pago => true})
    @total_periodo = find_by_Extrato.sum(:valr_pago)
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
      params.require(:sivic_lancamento).permit(:nome_lancamento, :valr_lancamento, :data_vencimento, :data_competencia, :flag_pago, :flag_dizimo, :numr_recorrencia, :sivic_category_id, :sivic_centrocusto_id, :sivic_rede_id, :sivic_tipmovfinanceiro_id, :sivic_pessoa_id, :sivic_fornecedor_id, :sivic_igreja_id, :user_id, :user_id, :data_exclusao, :sivic_contabanco_id, :data_pagamento_id, :valr_pago, :valr_jurosmulta, :valr_descontotaxa, :numr_parcela)
    end
end
