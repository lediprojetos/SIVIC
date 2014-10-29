class SivicAtividadepessoasController < ApplicationController
  before_action :set_sivic_atividadepessoa, only: [:show, :edit, :update, :destroy, :altera_situacao]

# GET /sivic_atividadepessoas
  # GET /sivic_atividadepessoas.json
  def index
    @sivic_atividadepessoas = SivicAtividadepessoa.all
  end

  # GET /sivic_atividadepessoas/1
  # GET /sivic_atividadepessoas/1.json
  def show
  end

  # GET /sivic_atividadepessoas/new
  def new
    @sivic_atividadepessoa = SivicAtividadepessoa.new
  end

  # GET /sivic_atividadepessoas/1/edit
  def edit
  end

  # POST /sivic_atividadepessoas
  # POST /sivic_atividadepessoas.json
  def create
    @sivic_atividadepessoa = SivicAtividadepessoa.new(sivic_atividadepessoa_params)

    respond_to do |format|
      if @sivic_atividadepessoa.save
        format.html { redirect_to @sivic_atividadepessoa, notice: 'Sivic atividadepessoa was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_atividadepessoa }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_atividadepessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  def altera_situacao 

    if @sivic_atividadepessoa.flag_ativo
        @sivic_atividadepessoa.flag_ativo = false
     else
        @sivic_atividadepessoa.flag_ativo = true
    end

     @sivic_atividadepessoa.save
     respond_to do |format|
      format.html { redirect_to sivic_atividadepessoas_url }
      format.json { head :no_content }
    end

  end

  # PATCH/PUT /sivic_atividadepessoas/1
  # PATCH/PUT /sivic_atividadepessoas/1.json
  def update
    respond_to do |format|
      if @sivic_atividadepessoa.update(sivic_atividadepessoa_params)
        format.html { redirect_to @sivic_atividadepessoa, notice: 'Sivic atividadepessoa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_atividadepessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_atividadepessoas/1
  # DELETE /sivic_atividadepessoas/1.json
  def destroy
    @sivic_atividadepessoa.destroy
    respond_to do |format|
      format.html { redirect_to sivic_atividadepessoas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_atividadepessoa
      @sivic_atividadepessoa = SivicAtividadepessoa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_atividadepessoa_params
      params.require(:sivic_atividadepessoa).permit(:flag_ativo, :data_exclusao, :data_bloqueio, :sivic_atividade_id, :sivic_igreja_id, :sivic_pessoaatividade, :sivic_pessoaresponsavel, :user_inclusao, :user_bloqueio, :user_exclusao)
    end
end
