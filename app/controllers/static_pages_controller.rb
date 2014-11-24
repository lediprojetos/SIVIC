class StaticPagesController < ApplicationController

  def home
    
    @total_discipulos = SivicDiscipulo.joins(:sivic_pessoa).where('sivic_pessoas.sivic_igreja_id = ? and data_exclusao is null',current_user.sivic_pessoa.sivic_igreja_id).count rescue nil

    @total_eventos = SivicEvento.where('sivic_igreja_id = ?', current_user.sivic_pessoa.sivic_igreja_id).count rescue nil

    @total_celulas = SivicCelula.joins(:sivic_pessoa).where('sivic_pessoas.sivic_igreja_id = ?',current_user.sivic_pessoa.sivic_igreja_id).count rescue nil

    @sivic_lancamentos = find_by_Extrato.order(:data_vencimento) rescue 0
    
    @total_recebimento = find_by_ContasReceber.sum(:valr_pago, :conditions => {:flag_pago => true}) rescue 0
    @total_pagamento = find_by_ContasPagar.sum(:valr_pago, :conditions => {:flag_pago => true}) rescue 0
    @total_periodo = find_by_Extrato.sum(:valr_pago) rescue 0

    @sivic_aniversariantes_do_dia = busca_aniversariantes_do_dia
  end

  def help
  end

  def about
  end

  def contact
    @sivic_contato = SivicContato.new
  end  

  def report
  end

  def plan
  end  

  def index
    #@sivic_users = User.paginate(:page => params[:page], :per_page => 10)

    @sivic_users = User.joins(:sivic_pessoa).where(sivic_pessoas: {sivic_igreja_id: current_user.sivic_pessoa.sivic_igreja_id}).paginate(:page => params[:page], :per_page => 10)
  end
  
end

