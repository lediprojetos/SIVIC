class SivicContcategoriesController < ApplicationController
  before_action :set_sivic_contcategory, only: [:show, :edit, :update, :destroy]

  # GET /sivic_contcategories
  # GET /sivic_contcategories.json
  def index
    @sivic_contcategories = SivicContcategory.all
  end

  # GET /sivic_contcategories/1
  # GET /sivic_contcategories/1.json
  def show
  end

  # GET /sivic_contcategories/new
  def new
    @sivic_contcategory = SivicContcategory.new
  end

  # GET /sivic_contcategories/1/edit
  def edit
  end

  # POST /sivic_contcategories
  # POST /sivic_contcategories.json
  def create
    @sivic_contcategory = SivicContcategory.new(sivic_contcategory_params)

    respond_to do |format|
      if @sivic_contcategory.save
        format.html { redirect_to @sivic_contcategory, notice: 'Sivic contcategory was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_contcategory }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_contcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_contcategories/1
  # PATCH/PUT /sivic_contcategories/1.json
  def update
    respond_to do |format|
      if @sivic_contcategory.update(sivic_contcategory_params)
        format.html { redirect_to @sivic_contcategory, notice: 'Sivic contcategory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_contcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_contcategories/1
  # DELETE /sivic_contcategories/1.json
  def destroy
    @sivic_contcategory.destroy
    respond_to do |format|
      format.html { redirect_to sivic_contcategories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_contcategory
      @sivic_contcategory = SivicContcategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_contcategory_params
      params.require(:sivic_contcategory).permit(:numr_contador, :sivic_igreja_id)
    end
end
