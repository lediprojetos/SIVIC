class SivicCelulasController < ApplicationController
  before_action :set_sivic_celula, only: [:show, :edit, :update, :destroy]

  # GET /sivic_celulas
  # GET /sivic_celulas.json
  def index
    @sivic_celulas = SivicCelula.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /sivic_celulas/1
  # GET /sivic_celulas/1.json
  def show
  end

  # GET /sivic_celulas/new
  def new
    @sivic_celula = SivicCelula.new
    @sivic_celula.build_sivic_endereco
  end

  # GET /sivic_celulas/1/edit
  def edit
    @sivic_estado = SivicCelula.find(params[:id])
    @sivic_estado = @sivic_estado.sivic_endereco.sivic_cidade.sivic_estado.id

    @sivic_cidade = SivicCidade.find :all, :conditions => {:sivic_estado_id => @sivic_estado}

    @sivic_cidade_setada = SivicCelula.find(params[:id])
    @sivic_cidade_setada = @sivic_cidade_setada.sivic_endereco.sivic_cidade.id
        
  end

  # POST /sivic_celulas
  # POST /sivic_celulas.json
  def create
    @sivic_celula = SivicCelula.new(sivic_celula_params)

    respond_to do |format|
      if @sivic_celula.save
        format.html { redirect_to @sivic_celula, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_celula }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_celula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_celulas/1
  # PATCH/PUT /sivic_celulas/1.json
  def update
    respond_to do |format|
      if @sivic_celula.update(sivic_celula_params)
        format.html { redirect_to @sivic_celula, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_celula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_celulas/1
  # DELETE /sivic_celulas/1.json
  def destroy
    @sivic_celula.destroy
    respond_to do |format|
      format.html { redirect_to sivic_celulas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_celula
      @sivic_celula = SivicCelula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_celula_params
      params.require(:sivic_celula).permit(:sivic_pessoa_id, :NUMR_Dia, :DATA_Bloqueio, :DESC_sexo, :FLAG_crianca, :FLAG_jovem, :FLAG_adulto, sivic_endereco_attributes: [ :id, :DESC_Bairro, :DESC_Rua, :DESC_Complemento, :DESC_Pontoreferencia, :NUMR_Cep, :sivic_cidade_id ])
    end
end
