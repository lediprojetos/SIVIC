class SivicCidadesController < ApplicationController
  #before_action :authenticate_user!
  #load_and_authorize_resource  

   def create
    @sivic_estado = SivicEstado.find(params[:sivic_estado_id])
    @sivic_cidade = @sivic_estado.sivic_cidades.create(comment_params)
    redirect_to sivic_estado_path(@sivic_estado)
   end

   def destroy
    @sivic_estado = SivicEstado.find(params[:sivic_estado_id])
    @sivic_cidade = @sivic_estado.sivic_cidades.find(params[:id])
    @sivic_cidade.destroy
    redirect_to sivic_estado_path(@sivic_estado)
  end

  def get_cities
    sivic_cidades = SivicCidade.find :all, :conditions => {:sivic_estado_id => params[:id]}, :order => "nome_cidade ASC"
    sivic_cidades_json = sivic_cidades.map {|item| {:id => item.id, :name => item.nome_cidade}}

    render :json => sivic_cidades_json
  end  

  def edit
  end

  def index
    @sivic_cidade = SivicCidade.all
  end

  private

  def comment_params
  params.require(:sivic_cidade).permit(:nome_cidade)
  end

end
