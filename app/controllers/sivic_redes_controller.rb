class SivicRedesController < ApplicationController
  before_action :set_sivic_rede, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sivic_redes
  # GET /sivic_redes.json
  def index
   
    #@sivic_redes = SivicRede.paginate(:page => params[:page], :per_page => 10)

   @sivic_redes = SivicRede.where(sivic_igreja_id: current_user.sivic_pessoa.sivic_igreja_id).paginate(:page => params[:page], :per_page => 10)   


   # @sivic_eventos = SivicEvento.where("data_encerramento is null and sivic_igreja_id = ?", current_user.sivic_pessoa.sivic_igreja_id).paginate(:page => params[:page], :per_page => 10)

  end

  # GET /sivic_redes/1
  # GET /sivic_redes/1.json
  def show
  end

  # GET /sivic_redes/new
  def new
    @sivic_rede = SivicRede.new
  end

  # GET /sivic_redes/1/edit
  def edit
  end

  # POST /sivic_redes
  # POST /sivic_redes.json
  def create
    @sivic_rede = SivicRede.new(sivic_rede_params)

    respond_to do |format|
      if @sivic_rede.save
        format.html { redirect_to @sivic_rede, notice: 'Rede inserida com sucesso.' }
        format.json { render action: 'show', status: :created, location: @sivic_rede }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_rede.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_redes/1
  # PATCH/PUT /sivic_redes/1.json
  def update
    respond_to do |format|
      if @sivic_rede.update(sivic_rede_params)
        format.html { redirect_to @sivic_rede, notice: 'Rede foi alterada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_rede.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_redes/1
  # DELETE /sivic_redes/1.json
  def destroy
    @sivic_rede.destroy
    respond_to do |format|
      format.html { redirect_to sivic_redes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_rede
      @sivic_rede = SivicRede.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_rede_params
      params.require(:sivic_rede).permit(:nome_rede, :sivic_igreja_id)
    end
end
