class SivicMinisteriosController < ApplicationController
  before_action :set_sivic_ministerio, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sivic_ministerios
  # GET /sivic_ministerios.json
  def index
    @sivic_ministerios = SivicMinisterio.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /sivic_ministerios/1
  # GET /sivic_ministerios/1.json
  def show
  end

  # GET /sivic_ministerios/new
  def new
    @sivic_ministerio = SivicMinisterio.new
  end

  # GET /sivic_ministerios/1/edit
  def edit
  end

  # POST /sivic_ministerios
  # POST /sivic_ministerios.json
  def create
    @sivic_ministerio = SivicMinisterio.new(sivic_ministerio_params)

    respond_to do |format|
      if @sivic_ministerio.save
        format.html { redirect_to @sivic_ministerio, notice: 'Registro inserido com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_ministerio }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_ministerio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_ministerios/1
  # PATCH/PUT /sivic_ministerios/1.json
  def update
    respond_to do |format|
      if @sivic_ministerio.update(sivic_ministerio_params)
        format.html { redirect_to @sivic_ministerio, notice: 'Registro alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_ministerio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_ministerios/1
  # DELETE /sivic_ministerios/1.json
  def destroy
    @sivic_ministerio.destroy
    respond_to do |format|
      format.html { redirect_to sivic_ministerios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_ministerio
      @sivic_ministerio = SivicMinisterio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_ministerio_params
      params.require(:sivic_ministerio).permit(:nome_ministerio, :sigl_ministerio, :sivic_igreja_id)
    end
end
