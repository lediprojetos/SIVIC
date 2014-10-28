class SivicCentrocustosController < ApplicationController
  before_action :set_sivic_centrocusto, only: [:show, :edit, :update, :destroy]

  # GET /sivic_centrocustos
  # GET /sivic_centrocustos.json
  def index
    @sivic_centrocustos = SivicCentrocusto.where(sivic_igreja_id: current_user.sivic_pessoa.sivic_igreja_id)
  end

  # GET /sivic_centrocustos/1
  # GET /sivic_centrocustos/1.json
  def show
  end

  # GET /sivic_centrocustos/new
  def new
    @sivic_centrocusto = SivicCentrocusto.new
  end

  # GET /sivic_centrocustos/1/edit
  def edit
  end

  # POST /sivic_centrocustos
  # POST /sivic_centrocustos.json
  def create
    @sivic_centrocusto = SivicCentrocusto.new(sivic_centrocusto_params)

    respond_to do |format|
      if @sivic_centrocusto.save
        format.html { redirect_to @sivic_centrocusto, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_centrocusto }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_centrocusto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_centrocustos/1
  # PATCH/PUT /sivic_centrocustos/1.json
  def update
    respond_to do |format|
      if @sivic_centrocusto.update(sivic_centrocusto_params)
        format.html { redirect_to @sivic_centrocusto, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_centrocusto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_centrocustos/1
  # DELETE /sivic_centrocustos/1.json
  def destroy
    @sivic_centrocusto.destroy
    respond_to do |format|
      format.html { redirect_to sivic_centrocustos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_centrocusto
      @sivic_centrocusto = SivicCentrocusto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_centrocusto_params
      params.require(:sivic_centrocusto).permit(:nome_centrocusto, :desc_centrocusto, :user_id, :sivic_igreja_id)
    end
end
