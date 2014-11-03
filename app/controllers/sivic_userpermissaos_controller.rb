class SivicUserpermissaosController < ApplicationController
  before_action :set_sivic_userpermissao, only: [:show, :edit, :update, :destroy]

  # GET /sivic_userpermissaos
  # GET /sivic_userpermissaos.json
  def index
    @sivic_userpermissaos = SivicUserpermissao.all
  end

  def usuariospermissoes
    @sivic_models = SivicModel.all
    @user_id = User.find_by_sivic_pessoa_id(params[:id])

    #debugger
  end

  def setaPermissoes

    userPermissao = SivicUserpermissao.where(:sivic_permissao_id => params[:sivic_permissao_id], :user_id => params[:user_id])

    if not userPermissao.first.nil?

      userPermissao.first.destroy

    else

      userPermissao = SivicUserpermissao.new

      userPermissao.sivic_permissao_id =  params[:sivic_permissao_id]
      userPermissao.user_id =  params[:user_id]
      userPermissao.save

    end

    userPermissao = SivicUserpermissao.where(:sivic_permissao_id => params[:sivic_permissao_id], :user_id => params[:user_id])

    userPermissao_json = userPermissao.map {|item| {:sivic_permissao_id => item.sivic_permissao_id, :user_id => item.user_id}}
    render :json => userPermissao_json    

  end

  # GET /sivic_userpermissaos/1
  # GET /sivic_userpermissaos/1.json
  def show
  end

  def usuarios
    @sivic_discipulos = SivicDiscipulo.find_by_name_or_all(params[:q],current_user.sivic_pessoa.sivic_igreja_id).paginate(:page => params[:page], :per_page => 10)
  end  

  # GET /sivic_userpermissaos/new
  def new
    @sivic_userpermissao = SivicUserpermissao.new
  end

  # GET /sivic_userpermissaos/1/edit
  def edit
  end

  # POST /sivic_userpermissaos
  # POST /sivic_userpermissaos.json
  def create
    @sivic_userpermissao = SivicUserpermissao.new(sivic_userpermissao_params)

    respond_to do |format|
      if @sivic_userpermissao.save
        format.html { redirect_to @sivic_userpermissao, notice: 'Sivic userpermissao was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sivic_userpermissao }
      else
        format.html { render action: 'new' }
        format.json { render json: @sivic_userpermissao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sivic_userpermissaos/1
  # PATCH/PUT /sivic_userpermissaos/1.json
  def update
    respond_to do |format|
      if @sivic_userpermissao.update(sivic_userpermissao_params)
        format.html { redirect_to @sivic_userpermissao, notice: 'Sivic userpermissao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sivic_userpermissao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sivic_userpermissaos/1
  # DELETE /sivic_userpermissaos/1.json
  def destroy
    @sivic_userpermissao.destroy
    respond_to do |format|
      format.html { redirect_to sivic_userpermissaos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sivic_userpermissao
      @sivic_userpermissao = SivicUserpermissao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sivic_userpermissao_params
      params.require(:sivic_userpermissao).permit(:sivic_permissao_id, :user_id)
    end
end
