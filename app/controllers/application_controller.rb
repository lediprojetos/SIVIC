class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception

before_filter :configure_devise_params, if: :devise_controller?

	def configure_devise_params

    	devise_parameter_sanitizer.for(:sign_up) do |u|
      		u.permit(:email, :password, :password_confirmation, :current_password, :role, :sivic_pessoa_id)
    	end

    	devise_parameter_sanitizer.for(:account_update) do |u|
      		u.permit(:email, :password, :password_confirmation, :current_password, :role, :sivic_pessoa_id)
    	end
	end

  def get_cities
    sivic_cidades = SivicCidade.find :all, :conditions => {:sivic_estado_id => params[:id]}, :order => "nome_cidade ASC"
    sivic_cidades_json = sivic_cidades.map {|item| {:id => item.id, :name => item.nome_cidade}}
 
    render :json => sivic_cidades_json
  end 

end
