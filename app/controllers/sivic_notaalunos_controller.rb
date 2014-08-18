class SivicNotaalunosController < ApplicationController
  before_action :set_sivic_notaaluno, only: [:show, :edit, :update, :destroy]

  # GET /sivic_notaalunos
  # GET /sivic_notaalunos.json
  def index
    @sivic_notaalunos = SivicNotaaluno.all
  end

  # GET /sivic_notaalunos/1
  # GET /sivic_notaalunos/1.json
  def show
  end

  # GET /sivic_notaalunos/new
  def new
    @sivic_notaaluno = SivicNotaaluno.new
  end

  # GET /sivic_notaalunos/1/edit
  def edit
  end

  # POST /sivic_notaalunos
  # POST /sivic_notaalunos.json
  def create
    @sivic_notaaluno = SivicNotaaluno.new(sivic_notaaluno_params)

    respond_to do |format|
      if @sivic_notaaluno.save
        format.html { redirect_to @sivic_notaaluno, notice: 'Sivic notaaluno was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_notaaluno }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_notaaluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_notaalunos/1
  # PATCH/PUT /sivic_notaalunos/1.json
  def update
    respond_to do |format|
      if @sivic_notaaluno.update(sivic_notaaluno_params)
        format.html { redirect_to @sivic_notaaluno, notice: 'Sivic notaaluno was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_notaaluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_notaalunos/1
  # DELETE /sivic_notaalunos/1.json
  def destroy
    @sivic_notaaluno.destroy
    respond_to do |format|
      format.html { redirect_to sivic_notaalunos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_notaaluno
      @sivic_notaaluno = SivicNotaaluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_notaaluno_params
      params.require(:sivic_notaaluno).permit(:nota, :sivic_licao_id, :sivic_turmaaluno_id, :user_id)
    end
end
