class SivicCidadesController < ApplicationController

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
