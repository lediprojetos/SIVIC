class SivicCategoriaController < ApplicationController
  before_action :set_sivic_categorium, only: [:show, :edit, :update, :destroy]

  # GET /sivic_categoria
  # GET /sivic_categoria.json
  def index
    @sivic_categoria = SivicCategorium.all
  end

  # GET /sivic_categoria/1
  # GET /sivic_categoria/1.json
  def show
  end

  # GET /sivic_categoria/new
  def new
    @sivic_categorium = SivicCategorium.new
  end

  # GET /sivic_categoria/1/edit
  def edit
  end

  # POST /sivic_categoria
  # POST /sivic_categoria.json
  def create
    @sivic_categorium = SivicCategorium.new(sivic_categorium_params)

    respond_to do |format|
      if @sivic_categorium.save
        format.html { redirect_to @sivic_categorium, notice: 'Sivic categorium was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_categorium }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_categorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_categoria/1
  # PATCH/PUT /sivic_categoria/1.json
  def update
    respond_to do |format|
      if @sivic_categorium.update(sivic_categorium_params)
        format.html { redirect_to @sivic_categorium, notice: 'Sivic categorium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_categorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_categoria/1
  # DELETE /sivic_categoria/1.json
  def destroy
    @sivic_categorium.destroy
    respond_to do |format|
      format.html { redirect_to sivic_categoria_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_categorium
      @sivic_categorium = SivicCategorium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_categorium_params
      params.require(:sivic_categorium).permit(:nome_categoria, :tipo_categoria, :user_id, :sivic_igreja_id)
    end
end
