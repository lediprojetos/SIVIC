class SivicFechamentosController < ApplicationController
  before_action :set_sivic_fechamento, only: [:show, :edit, :update, :destroy]

  # GET /sivic_fechamentos
  # GET /sivic_fechamentos.json
  def index
    @sivic_fechamentos = SivicFechamento.all
  end

  # GET /sivic_fechamentos/1
  # GET /sivic_fechamentos/1.json
  def show
  end

  # GET /sivic_fechamentos/new
  def new
    @sivic_fechamento = SivicFechamento.new
  end

  # GET /sivic_fechamentos/1/edit
  def edit
  end

  # POST /sivic_fechamentos
  # POST /sivic_fechamentos.json
  def create
    @sivic_fechamento = SivicFechamento.new(sivic_fechamento_params)

    respond_to do |format|
      if @sivic_fechamento.save


        format.html { redirect_to @sivic_fechamento, notice: 'Sivic fechamento was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_fechamento }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_fechamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_fechamentos/1
  # PATCH/PUT /sivic_fechamentos/1.json
  def update

    respond_to do |format|
      if @sivic_fechamento.update(sivic_fechamento_params)
        format.html { redirect_to @sivic_fechamento, notice: 'Sivic fechamento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_fechamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_fechamentos/1
  # DELETE /sivic_fechamentos/1.json
  def destroy
    @sivic_fechamento.destroy
    respond_to do |format|
      format.html { redirect_to sivic_fechamentos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_fechamento
      @sivic_fechamento = SivicFechamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_fechamento_params
      params.require(:sivic_fechamento).permit(:sivic_igreja_id, :desc_fechamento, :valr_fechamento, :tipo_fechamento, :data_fechamento, :data_exclusao, :user_inclusao, :user_exclusao)
    end
end
