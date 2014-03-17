class SivicContcelulasController < ApplicationController
  before_action :set_sivic_contcelula, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sivic_contcelulas
  # GET /sivic_contcelulas.json
  def index
    @sivic_contcelulas = SivicContcelula.all
  end

  # GET /sivic_contcelulas/1
  # GET /sivic_contcelulas/1.json
  def show
  end

  # GET /sivic_contcelulas/new
  def new
    @sivic_contcelula = SivicContcelula.new
  end

  # GET /sivic_contcelulas/1/edit
  def edit
  end

  # POST /sivic_contcelulas
  # POST /sivic_contcelulas.json
  def create
    @sivic_contcelula = SivicContcelula.new(sivic_contcelula_params)

    respond_to do |format|
      if @sivic_contcelula.save
        format.html { redirect_to @sivic_contcelula, notice: 'Sivic contcelula was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_contcelula }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_contcelula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_contcelulas/1
  # PATCH/PUT /sivic_contcelulas/1.json
  def update
    respond_to do |format|
      if @sivic_contcelula.update(sivic_contcelula_params)
        format.html { redirect_to @sivic_contcelula, notice: 'Sivic contcelula was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_contcelula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_contcelulas/1
  # DELETE /sivic_contcelulas/1.json
  def destroy
    @sivic_contcelula.destroy
    respond_to do |format|
      format.html { redirect_to sivic_contcelulas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_contcelula
      @sivic_contcelula = SivicContcelula.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_contcelula_params
      params.require(:sivic_contcelula).permit(:NUMR_Contador, :sivic_igreja_id)
    end
end
