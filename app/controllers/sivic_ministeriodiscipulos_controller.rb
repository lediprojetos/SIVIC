class SivicMinisteriodiscipulosController < ApplicationController
  before_action :set_sivic_ministeriodiscipulo, only: [:show, :edit, :update, :destroy]

  # GET /sivic_ministeriodiscipulos
  # GET /sivic_ministeriodiscipulos.json
  def index
    @sivic_ministeriodiscipulos = SivicMinisteriodiscipulo.all
	@sivic_discipulos = SivicDiscipulo.joins('INNER JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('lower(sp.NOME_pessoa) like ? and sp.sivic_igreja_id = ?', "%#{params[:q]}%", current_user.sivic_pessoa.sivic_igreja_id)        
  end

  # GET /sivic_ministeriodiscipulos/1
  # GET /sivic_ministeriodiscipulos/1.json
  def show
  end

  def adicionaministerio
  	@sivic_ministeriodiscipulo = SivicMinisteriodiscipulo.new
  	@sivic_discipulo = SivicDiscipulo.find_by_id(params[:id])
  	@sivic_ministerios = SivicMinisteriodiscipulo.where(:sivic_discipulo_id => params[:id])
  end

  # GET /sivic_ministeriodiscipulos/new
  def new
    @sivic_ministeriodiscipulo = SivicMinisteriodiscipulo.new
  end

  # GET /sivic_ministeriodiscipulos/1/edit
  def edit
  end

  # POST /sivic_ministeriodiscipulos
  # POST /sivic_ministeriodiscipulos.json
  def create
    @sivic_ministeriodiscipulo = SivicMinisteriodiscipulo.new(sivic_ministeriodiscipulo_params)

    @sivic_ministeriodiscipulo.data_inclusao = Date.today

    if @sivic_ministeriodiscipulo.flag_ministerioativo
		#@sivic_ministeriodiscipulos = SivicMinisteriodiscipulo.where()
	end

    #debugger

    respond_to do |format|
      if @sivic_ministeriodiscipulo.save
        format.html { redirect_to adicionaministerio_sivic_ministeriodiscipulo_path(sivic_ministeriodiscipulo_params.first[1]), notice: 'Registro inserido com sucesso.' }
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
    @sivic_ministeriodiscipulo.destroy
    respond_to do |format|
      format.html { redirect_to sivic_ministeriodiscipulos_url }
      format.json { head :no_content }
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
