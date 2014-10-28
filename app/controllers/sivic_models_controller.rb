class SivicModelsController < ApplicationController
  before_action :set_sivic_model, only: [:show, :edit, :update, :destroy]

  # GET /sivic_models
  # GET /sivic_models.json
  def index
    @sivic_models = SivicModel.all
  end

  # GET /sivic_models/1
  # GET /sivic_models/1.json
  def show
  end

  # GET /sivic_models/new
  def new
    @sivic_model = SivicModel.new
  end

  # GET /sivic_models/1/edit
  def edit
  end

  # POST /sivic_models
  # POST /sivic_models.json
  def create
    @sivic_model = SivicModel.new(sivic_model_params)

    respond_to do |format|
      if @sivic_model.save
        format.html { redirect_to @sivic_model, notice: 'Sivic model was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_model }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_models/1
  # PATCH/PUT /sivic_models/1.json
  def update
    respond_to do |format|
      if @sivic_model.update(sivic_model_params)
        format.html { redirect_to @sivic_model, notice: 'Sivic model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_models/1
  # DELETE /sivic_models/1.json
  def destroy
    @sivic_model.destroy
    respond_to do |format|
      format.html { redirect_to sivic_models_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_model
      @sivic_model = SivicModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_model_params
      params.require(:sivic_model).permit(:nome_model, :desc_model, :data_bloqueio, :sivic_modulo_id)
    end
end
