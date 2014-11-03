class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception

before_filter :configure_devise_params, if: :devise_controller?

before_filter do
  resource = controller_name.singularize.to_sym
  method = "#{resource}_params"
  params[resource] &&= send(method) if respond_to?(method, true)
end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end
  
def configure_devise_params

  	devise_parameter_sanitizer.for(:sign_up) do |u|
    		u.permit(:email, :password, :password_confirmation, :current_password, :role, :sivic_pessoa_id)
  	end

  	devise_parameter_sanitizer.for(:account_update) do |u|
    		u.permit(:email, :password, :password_confirmation, :current_password, :role, :sivic_pessoa_id)
  	end
end

def find_by_ContasPagar

    if session[:data_ini] == nil
      session[:data_ini] = Date.today
      session[:data_fim] = Date.today
      session[:data_ini] = session[:data_ini].at_beginning_of_month.strftime
      session[:data_fim] = session[:data_fim].at_end_of_month.strftime
    end     

    SivicLancamento.where('data_vencimento >= ? and data_vencimento <= ? and sivic_igreja_id = ? and data_exclusao is null and sivic_tipmovfinanceiro_id = 1',session[:data_ini], session[:data_fim], current_user.sivic_pessoa.sivic_igreja_id)
end

def find_by_ContasReceber
    
    if session[:data_ini] == nil
      session[:data_ini] = Date.today
      session[:data_fim] = Date.today
      session[:data_ini] = session[:data_ini].at_beginning_of_month.strftime
      session[:data_fim] = session[:data_fim].at_end_of_month.strftime
    end     

    SivicLancamento.where('data_vencimento >= ? and data_vencimento <= ? and sivic_igreja_id = ? and data_exclusao is null and sivic_tipmovfinanceiro_id = 2',session[:data_ini], session[:data_fim], current_user.sivic_pessoa.sivic_igreja_id)
end

def find_by_Extrato
    
    if session[:data_ini] == nil
      session[:data_ini] = Date.today
      session[:data_fim] = Date.today
      session[:data_ini] = session[:data_ini].at_beginning_of_month.strftime
      session[:data_fim] = session[:data_fim].at_end_of_month.strftime
    end     

    SivicLancamento.where('data_vencimento >= ? and data_vencimento <= ? and sivic_igreja_id = ? and data_exclusao is null',session[:data_ini], session[:data_fim], current_user.sivic_pessoa.sivic_igreja_id)
end    

end
