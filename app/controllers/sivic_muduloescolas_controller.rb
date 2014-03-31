class SivicMuduloescolasController < ApplicationController
  before_action :set_sivic_muduloescola, only: [:show, :edit, :update, :destroy]

  # GET /sivic_muduloescolas
  # GET /sivic_muduloescolas.json
  def index
    @sivic_muduloescolas = SivicMuduloescola.all
  end

  # GET /sivic_muduloescolas/1
  # GET /sivic_muduloescolas/1.json
  def show
  end

  # GET /sivic_muduloescolas/new
  def new
    @sivic_muduloescola = SivicMuduloescola.new
  end

  # GET /sivic_muduloescolas/1/edit
  def edit
  end

  # POST /sivic_muduloescolas
  # POST /sivic_muduloescolas.json
  def create
    @sivic_muduloescola = SivicMuduloescola.new(sivic_muduloescola_params)

    respond_to do |format|
      if @sivic_muduloescola.save
        format.html { redirect_to @sivic_muduloescola, notice: 'Sivic muduloescola was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_muduloescola }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_muduloescola.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_muduloescolas/1
  # PATCH/PUT /sivic_muduloescolas/1.json
  def update
    respond_to do |format|
      if @sivic_muduloescola.update(sivic_muduloescola_params)
        format.html { redirect_to @sivic_muduloescola, notice: 'Sivic muduloescola was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_muduloescola.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_muduloescolas/1
  # DELETE /sivic_muduloescolas/1.json
  def destroy
    @sivic_muduloescola.destroy
    respond_to do |format|
      format.html { redirect_to sivic_muduloescolas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_muduloescola
      @sivic_muduloescola = SivicMuduloescola.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_muduloescola_params
      params.require(:sivic_muduloescola).permit(:sivic_igreja_id, :user_id, :nome_modulo)
    end
end
