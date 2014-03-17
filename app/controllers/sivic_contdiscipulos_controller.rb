class SivicContdiscipulosController < ApplicationController
  before_action :set_sivic_contdiscipulo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sivic_contdiscipulos
  # GET /sivic_contdiscipulos.json
  def index
    @sivic_contdiscipulos = SivicContdiscipulo.all
  end

  # GET /sivic_contdiscipulos/1
  # GET /sivic_contdiscipulos/1.json
  def show
  end

  # GET /sivic_contdiscipulos/new
  def new
    @sivic_contdiscipulo = SivicContdiscipulo.new
  end

  # GET /sivic_contdiscipulos/1/edit
  def edit
  end

  # POST /sivic_contdiscipulos
  # POST /sivic_contdiscipulos.json
  def create
    @sivic_contdiscipulo = SivicContdiscipulo.new(sivic_contdiscipulo_params)

    respond_to do |format|
      if @sivic_contdiscipulo.save
        format.html { redirect_to @sivic_contdiscipulo, notice: 'Sivic contdiscipulo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_contdiscipulo }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_contdiscipulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_contdiscipulos/1
  # PATCH/PUT /sivic_contdiscipulos/1.json
  def update
    respond_to do |format|
      if @sivic_contdiscipulo.update(sivic_contdiscipulo_params)
        format.html { redirect_to @sivic_contdiscipulo, notice: 'Sivic contdiscipulo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_contdiscipulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_contdiscipulos/1
  # DELETE /sivic_contdiscipulos/1.json
  def destroy
    @sivic_contdiscipulo.destroy
    respond_to do |format|
      format.html { redirect_to sivic_contdiscipulos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_contdiscipulo
      @sivic_contdiscipulo = SivicContdiscipulo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_contdiscipulo_params
      params.require(:sivic_contdiscipulo).permit(:NUMR_Contador, :sivic_igreja_id)
    end
end
