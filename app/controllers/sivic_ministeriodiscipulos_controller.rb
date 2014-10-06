#encoding: utf-8
class SivicMinisteriodiscipulosController < ApplicationController
  before_action :set_sivic_ministeriodiscipulo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sivic_ministeriodiscipulos
  # GET /sivic_ministeriodiscipulos.json
  def index
    authorize! :read, SivicMinisteriodiscipulo
    @sivic_ministeriodiscipulos = SivicMinisteriodiscipulo.all
    @sivic_discipulos = SivicDiscipulo.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('lower(sp.NOME_pessoa) like ? and sp.sivic_igreja_id = ?', "%#{params[:q]}%", current_user.sivic_pessoa.sivic_igreja_id).order('sp.NOME_pessoa ASC').paginate(:page => params[:page], :per_page => 10)
  end

  # GET /sivic_ministeriodiscipulos/1
  # GET /sivic_ministeriodiscipulos/1.json
  def show
  end

  def adicionaministerio
    authorize! :adicionaministerio, SivicMinisteriodiscipulo
    @sivic_ministeriodiscipulo = SivicMinisteriodiscipulo.new
    @sivic_discipulo = SivicDiscipulo.find_by_id(params[:id])
    @sivic_ministerios = SivicMinisteriodiscipulo.where(:sivic_discipulo_id => params[:id]).order("created_at DESC")
  end

  # GET /sivic_ministeriodiscipulos/new
  def new
    authorize! :create, SivicMinisteriodiscipulo
    @sivic_ministeriodiscipulo = SivicMinisteriodiscipulo.new
  end

  # GET /sivic_ministeriodiscipulos/1/edit
  def edit
    authorize! :update, SivicMinisteriodiscipulo
  end

  # POST /sivic_ministeriodiscipulos
  # POST /sivic_ministeriodiscipulos.json
 def create
    authorize! :create, SivicMinisteriodiscipulo
  sivic_discipulo_id = sivic_ministeriodiscipulo_params[:sivic_discipulo_id]
  sivic_ministerio_id = sivic_ministeriodiscipulo_params[:sivic_ministerio_id]
  
  existente = SivicMinisteriodiscipulo.where(:sivic_discipulo_id => sivic_discipulo_id, :sivic_ministerio_id => sivic_ministerio_id )  
  #debugger
  if existente.first
    respond_to do |format|
      format.html { redirect_to adicionaministerio_sivic_ministeriodiscipulo_path(sivic_discipulo_id), notice: 'Este ministério já encontra-se cadastrado.' }
    end    
    return
  end

  @sivic_ministeriodiscipulo = SivicMinisteriodiscipulo.new(sivic_ministeriodiscipulo_params)
  #@sivic_ministeriodiscipulo.data_inclusao = Date.today  

  if @sivic_ministeriodiscipulo.flag_ministerioativo
    @sivic_ministeriodiscipulos = SivicMinisteriodiscipulo.find_by_sivic_discipulo_id(sivic_discipulo_id)
    if @sivic_ministeriodiscipulos
      @sivic_ministeriodiscipulos.flag_ministerioativo = false
      @sivic_ministeriodiscipulos.save
    end
  end

  respond_to do |format|
    if @sivic_ministeriodiscipulo.save
      format.html { redirect_to adicionaministerio_sivic_ministeriodiscipulo_path(sivic_discipulo_id), notice: 'Registro inserido com sucesso.' }
      format.json { render action: 'show', status: :created, location: @sivic_ministeriodiscipulo }
    else
      format.html { render action: 'new' }
      format.json { render json: @sivic_ministeriodiscipulo.errors, status: :unprocessable_entity }
    end
  end
end

  # PATCH/PUT /sivic_ministeriodiscipulos/1
  # PATCH/PUT /sivic_ministeriodiscipulos/1.json
  def update
    authorize! :update, SivicMinisteriodiscipulo
    respond_to do |format|
      if @sivic_ministeriodiscipulo.update(sivic_ministeriodiscipulo_params)
        format.html { redirect_to @sivic_ministeriodiscipulo, notice: 'Sivic ministeriodiscipulo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_ministeriodiscipulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_ministeriodiscipulos/1
  # DELETE /sivic_ministeriodiscipulos/1.json
  def destroy
    authorize! :destroy, SivicMinisteriodiscipulo
    @sivic_ministeriodiscipulo.destroy

    respond_to do |format|
        format.html { redirect_to adicionaministerio_sivic_ministeriodiscipulo_path(@sivic_ministeriodiscipulo.sivic_discipulo_id), notice: 'Registro excluído com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_ministeriodiscipulo }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_ministeriodiscipulo
      @sivic_ministeriodiscipulo = SivicMinisteriodiscipulo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_ministeriodiscipulo_params
      params.require(:sivic_ministeriodiscipulo).permit(:sivic_discipulo_id, :sivic_ministerio_id, :flag_ministerioativo, :data_inclusao)
    end
end
