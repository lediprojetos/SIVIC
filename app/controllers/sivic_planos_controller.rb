class SivicPlanosController < ApplicationController
  before_action :set_sivic_plano, only: [:show, :edit, :update, :destroy]

  # GET /sivic_planos
  # GET /sivic_planos.json
  def index
    @sivic_planos = SivicPlano.all
  end

  # GET /sivic_planos/1
  # GET /sivic_planos/1.json
  def show
  end

  # GET /sivic_planos/new
  def new
    @sivic_plano = SivicPlano.new
  end

  # GET /sivic_planos/1/edit
  def edit
  end

  # POST /sivic_planos
  # POST /sivic_planos.json
  def create
    @sivic_plano = SivicPlano.new(sivic_plano_params)

    respond_to do |format|
      if @sivic_plano.save
        format.html { redirect_to @sivic_plano, notice: 'Sivic plano was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_plano }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_plano.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_planos/1
  # PATCH/PUT /sivic_planos/1.json
  def update
    respond_to do |format|
      if @sivic_plano.update(sivic_plano_params)
        format.html { redirect_to @sivic_plano, notice: 'Sivic plano was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_plano.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_planos/1
  # DELETE /sivic_planos/1.json
  def destroy
    @sivic_plano.destroy
    respond_to do |format|
      format.html { redirect_to sivic_planos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_plano
      @sivic_plano = SivicPlano.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_plano_params
      params.require(:sivic_plano).permit(:nome_plano, :numr_qtdmembro, :numr_qtdusuario)
    end
end
