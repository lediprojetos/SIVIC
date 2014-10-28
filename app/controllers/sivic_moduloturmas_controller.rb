class SivicModuloturmasController < ApplicationController
  before_action :set_sivic_moduloturma, only: [:show, :edit, :update, :destroy]

  # GET /sivic_moduloturmas
  # GET /sivic_moduloturmas.json
  def index
    @sivic_moduloturmas = SivicModuloturma.all
  end

  # GET /sivic_moduloturmas/1
  # GET /sivic_moduloturmas/1.json
  def show
  end

  # GET /sivic_moduloturmas/new
  def new
    @sivic_moduloturma = SivicModuloturma.new
  end

  # GET /sivic_moduloturmas/1/edit
  def edit
  end

  # POST /sivic_moduloturmas
  # POST /sivic_moduloturmas.json
  def create
    @sivic_moduloturma = SivicModuloturma.new(sivic_moduloturma_params)

    respond_to do |format|
      if @sivic_moduloturma.save
        format.html { redirect_to @sivic_moduloturma, notice: 'Sivic moduloturma was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_moduloturma }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_moduloturma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_moduloturmas/1
  # PATCH/PUT /sivic_moduloturmas/1.json
  def update
    respond_to do |format|
      if @sivic_moduloturma.update(sivic_moduloturma_params)
        format.html { redirect_to @sivic_moduloturma, notice: 'Sivic moduloturma was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_moduloturma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_moduloturmas/1
  # DELETE /sivic_moduloturmas/1.json
  def destroy
    @sivic_moduloturma.destroy
    respond_to do |format|
      format.html { redirect_to sivic_moduloturmas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_moduloturma
      @sivic_moduloturma = SivicModuloturma.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_moduloturma_params
      params.require(:sivic_moduloturma).permit(:sivic_moduloescola_id, :sivic_turma_id)
    end
end
