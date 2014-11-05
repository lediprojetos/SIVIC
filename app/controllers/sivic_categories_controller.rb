class SivicCategoriesController < ApplicationController
  before_action :set_sivic_category, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /sivic_categories
  # GET /sivic_categories.json
  def index
    @sivic_categories = SivicCategory.where(sivic_igreja_id: current_user.sivic_pessoa.sivic_igreja_id)
  end

  # GET /sivic_categories/1
  # GET /sivic_categories/1.json
  def show
  end

  # GET /sivic_categories/new
  def new
    @sivic_category = SivicCategory.new
  end

  # GET /sivic_categories/1/edit
  def edit

    @sivic_categoriaPai = SivicCategory.find(params[:id])
    @sivic_categoriaPai = @sivic_categoriaPai.father_id
    
  end

  # POST /sivic_categories
  # POST /sivic_categories.json
  def create
    @sivic_category = SivicCategory.new(sivic_category_params)

    respond_to do |format|
      if @sivic_category.save
        format.html { redirect_to @sivic_category, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_categories/1
  # PATCH/PUT /sivic_categories/1.json
  def update
    respond_to do |format|
      if @sivic_category.update(sivic_category_params)
        format.html { redirect_to @sivic_category, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_categories/1
  # DELETE /sivic_categories/1.json
  def destroy
    @sivic_category.destroy
    respond_to do |format|
      format.html { redirect_to sivic_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_category
      @sivic_category = SivicCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_category_params
      params.require(:sivic_category).permit(:father_id, :nome_categoria, :tipo_categoria, :sivic_igreja_id, :user_inclusao)
    end
end
