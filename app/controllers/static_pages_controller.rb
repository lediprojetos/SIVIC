class StaticPagesController < ApplicationController

  def home

    @total_discipulos = SivicDiscipulo.joins(:sivic_pessoa).where('sivic_pessoas.sivic_igreja_id = ?',current_user.sivic_pessoa.sivic_igreja_id).count
    @total_celulas = SivicCelula.joins(:sivic_pessoa).where('sivic_pessoas.sivic_igreja_id = ?',current_user.sivic_pessoa.sivic_igreja_id).count

    @sivic_lancamentos = find_by_Extrato.order(:data_vencimento)
    
    @total_recebimento = find_by_ContasReceber.sum(:valr_pago, :conditions => {:flag_pago => true})
    @total_pagamento = find_by_ContasPagar.sum(:valr_pago, :conditions => {:flag_pago => true})
    @total_periodo = find_by_Extrato.sum(:valr_pago)
  end

  def help
  end

  def about
  end

  def contact
  end  

  def report
  end

  def index
    @sivic_users = User.paginate(:page => params[:page], :per_page => 10)
  end
  
end

